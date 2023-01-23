# Maintainer: Guilhelm Savin <aur@gsav.in>
# Maintainer: Jake <aur@ja-ke.tech>
#
# Upstream URL: https://github.com/platformio/platformio
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/gsavin/arch
#

pkgname=('platformio' 'platformio-udev-rules')
pkgver=6.1.6
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
         'python-marshmallow'
         # Python 3
         'python-zeroconf'
         # "pio home" requirements:
         'python-aiofiles'
         'python-ajsonrpc'
         'python-starlette'
         'python-wsproto'
         'uvicorn')
optdepends=('python-click-completion: for shell completions'
           'python-shellingham: for shell completions')
conflicts=('platformio-git')
source=("https://github.com/platformio/platformio-core/archive/v${pkgver}.tar.gz")
sha256sums=('dcafb718ab22efcf16e16772272624c2361a55684ab7812c450e73ede39e1137')

package_platformio() {
    cd "$srcdir/platformio-core-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_platformio-udev-rules() {
    depends=('udev')
    optdepends=()
    pkgdesc="udev rules for PlatformIO supported boards/devices"
    url="https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules"

    cd "$srcdir/platformio-core-$pkgver"
    install -m644 -Dt "$pkgdir/usr/lib/udev/rules.d" "platformio/assets/system/99-platformio-udev.rules"
}
