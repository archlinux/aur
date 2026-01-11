# Maintainer: Jim Madge <jim+aur@jmadge.com>
# Contributor: Tomasz Bursztyka <tomasz dot bursztyka at proton dot me>
_name=scikit_fmm
pkgname=python-scikit-fmm
pkgver=2025.6.23
pkgrel=1
pkgdesc="The fast marching method for Python"
arch=("any")
url="https://scikit-fmm.readthedocs.io"
license=("BSD-3-Clause")
depends=(
    "python-numpy"
)
makedepends=(
    "meson-python"
    "python-build"
    "python-installer"
    "python-wheel"
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=("a3208f5f3881e40b7878d1121ba39b8d57f1bc38fb4e5f0d9d1c66a9b007e44f")

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
