# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: irmluity <45vw4yz8g@mozmail.com>

pkgname=python-pybase64-git
_pkgname=pybase64
pkgver=1.4.3.r63.g88c786d
pkgrel=1
pkgdesc="Fast Base64 encoding/decoding in Python"
arch=("any")
url="https://github.com/mayeut/pybase64"
license=('BSD-2-Clause')
depends=('libgomp' 'python' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'cmake')
provides=("${pkgname%-git}" "${_pkgname}")
conflicts=("${pkgname%-git}")
source=(
    "git+https://github.com/mayeut/pybase64"
)
sha256sums=(
    "SKIP"
)

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/python-${_pkgname}/
}

