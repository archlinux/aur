# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=python-pybase64-git
_pkgname=pybase64
pkgver=1.3.0
pkgrel=1
pkgdesc="Fast Base64 encoding/decoding in Python"
arch=("any")
url="https://github.com/mayeut/pybase64"
license=('BSD-2-Clause')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-pip')
provides=(${_pkgname})
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

package() {
    cd "$srcdir/${_pkgname}"
    python -m pip install --no-deps --ignore-installed --prefix="$pkgdir/usr" .
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/python-${_pkgname}/
}

