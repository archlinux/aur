# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=icoextract
pkgver=0.1.4
pkgrel=1
pkgdesc='Icon extractor for Windows PE files (.exe/.dll) with optional thumbnailer functionality'
arch=('any')
url='https://github.com/jlu5/icoextract'
license=('MIT')
depends=('python-pefile')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-pillow: required for the optional thumbnailer')
provides=('exe-thumbnailer')
conflicts=('exe-thumbnailer')
source=("https://github.com/jlu5/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9d84a6191c02326bdf6f7689184540aba5b683b9c626ed832ff20c426f2d6746')

build() {
    cd ${pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 exe-thumbnailer.thumbnailer "${pkgdir}"/usr/share/thumbnailers/exe-thumbnailer.thumbnailer

    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
