# Maintainer: Popolon <popolon@popolon.org>

pkgname=('yoga-image-optimizer')
pkgver='1.1.0'
pkgrel=1
pkgdesc="A graphical interface to convert and optimize JPEG, PNG and WebP images (based on YOGA)"
url="https://github.com/flozz/yoga-image-optimizer"
depends=('python>=3.7' 'python-cairo' 'python-gobject' 'yoga>=1.1.0')
makedepends=('python-setuptools' 'python-nox' 'gettext')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flozz/yoga-image-optimizer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8105558f54784416c798c55152a7f160aa7e0e3ad61730913223c954d1269fc6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    nox -s locales_compile
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    linuxpkg/copy-data.sh "${pkgdir}"/usr/
}
