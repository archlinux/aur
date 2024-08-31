# Maintainer: weipeng <weipeng1999@qq.com>
_name="properscoring"
pkgname=python-${_name}
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Proper scoring rules for evaluating probabilistic forecasts in Python."
arch=("any")
url="https://github.com/properscoring/properscoring"
license=('Apache-2.0')
groups=()
depends=("python" "python-numpy" "python-scipy")
makedepends=(
    "python-build" "python-installer"  "python-wheel"
    # "python-setuptools" "python-setuptools-scm"
)
checkdepends=("python-nose")
optdepends=("python-numba")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "fix_test_brier.patch"
    "fix_expand_dims.patch"
)
noextract=()
sha256sums=(
    '55564e97da32c4db6ba05926d403a5c0fdfa4655fc4ed125c40095a8bd7484a4'
    '69b6f57b041708fc7731b26e0caa491edfd367e631eb3b34e4e2772eae16f16a'
    '0609120c7016756718107464d8b1149215dc776ab763a32e093a0f878ba081b5'
)
validpgpkeys=()

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch -Np1 -i ../fix_test_brier.patch
    patch -Np1 -i ../fix_expand_dims.patch
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
    # python setup.py build
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    nosetests
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # python setup.py install --root="$pkgdir" --optimize=1
}

