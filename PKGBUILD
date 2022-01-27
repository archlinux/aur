# Contributor: Popolon <popolon@popolon.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=yoga-image-optimizer
pkgver=1.1.1
pkgrel=1
pkgdesc="A graphical interface to convert and optimize JPEG, PNG and WebP images (based on YOGA)"
url="https://github.com/flozz/yoga-image-optimizer"
depends=('python>=3.7' 'python-cairo' 'python-gobject' 'yoga' 'hicolor-icon-theme')
makedepends=('python-setuptools' 'python-nox' 'gettext')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flozz/yoga-image-optimizer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('85181a8b47978358d3fcf18ba6d41d4ab88e36e19f77547f12abb1c18a5acdf5')

build() {
    cd ${pkgname}-${pkgver}
    nox -s locales_compile
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    linuxpkg/copy-data.sh "${pkgdir}"/usr/
}
