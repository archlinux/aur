# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=icoextract
pkgver=0.1.3
pkgrel=2
pkgdesc='Icon extractor for Windows PE files (.exe/.dll) with optional thumbnailer functionality'
arch=('any')
url='https://github.com/jlu5/icoextract'
license=('MIT')
depends=('python-pefile')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-pillow: required for the optional thumbnailer')
provides=('exe-thumbnailer')
source=("https://github.com/jlu5/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ca2450e716b6c65cf695c1b480e5503b8103b10ed8de5110eac0778fbc502117')

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
