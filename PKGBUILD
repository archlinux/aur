# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-dunamai"
_name=${pkgname#python-}
pkgdesc="Produce dynamic, standards-compliant version strings"
url="https://github.com/mtkennerly/dunamai"

pkgver=1.15.0
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
b2sums=("521b7778147ea2c526cfd32362dd6f4e9838f84b369410fccc7af33547eea51984f1349dead1fe16b76bee39dc2f397a2c1a5dbddf821bf5607ee9b3d6e76e79")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
