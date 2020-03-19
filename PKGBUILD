# Maintainer: Guilhelm Savin <aur@gsav.in>
# Maintainer: Jake <aur@ja-ke.tech>
#
# Upstream URL: https://github.com/platformio/platformio
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/gsavin/arch
#

pkgname=platformio
pkgver=4.3.0
pkgrel=1
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="https://github.com/platformio/platformio-core/"
license=('Apache')
depends=('python-setuptools'
         'python-bottle'
         'python-click'
         'python-colorama'
         'python-pyserial>=3.4' #https://github.com/platformio/platformio-core/commit/a37eb9868f3b20e982d0c3cd1a742fcb8ab60efc
         'python-requests'
         'python-semantic-version'
         'python-tabulate'
         'python-pyelftools'
         'python-marshmallow')
conflicts=('platformio-git')
source=("https://github.com/platformio/platformio-core/archive/v${pkgver}.tar.gz"
        "click_version.patch")
sha256sums=('e2ed3523b20520ea7ba2a278c7181ce61c065c02e7d3af692f4c1c7c8aaba3c8'
            'c1769958f372568a9d5ca7bd553de75af435c190db6ae9b91b9e8c2816fafcba')

prepare() {
    cd "$srcdir/platformio-core-$pkgver"
    # Revert python-click version limit, because it is just for windows
    # https://github.com/pallets/click/issues/1501
    patch -Rp1 < ../click_version.patch
}
           
package() {
    cd "$srcdir/platformio-core-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
