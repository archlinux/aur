# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-dunamai"
_name=${pkgname#python-}
pkgdesc="Produce dynamic, standards-compliant version strings"
url="https://github.com/mtkennerly/dunamai"

pkgver=1.14.1
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
b2sums=("8c504ddce66774a700554f9f355e0a13fb1e9bcf914719ac2f31208da3d679364252180d3e4936cfcdca070f7a7e2ec9bd807bbd8ae3d8f7b911e9773203e6f5")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
