# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-dunamai"
_name=${pkgname#python-}
pkgdesc="Produce dynamic, standards-compliant version strings"
url="https://github.com/mtkennerly/dunamai"

pkgver=1.14.0
pkgrel=1

arch=("any")
license=("MIT")

makedepends=(
    "poetry"
    "python-build"
    "python-installer"
    "python-wheel"
)
depends=(
    "python"
    "python-importlib-metadata"
    "python-packaging"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("aecc42b0176e7f5c2cacb5993d1a95dba6608c370d67910922bed70ac61fb1d2afe67ecbfe5fe625151d002cee50816023a77e66807d45f7bdc28323f9a54200")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
