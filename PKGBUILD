# Maintainer: Eduard Krivosapkin <buttersus@mail.ru>
_pkgname=flip-jump
pkgname=flip-jump-git
pkgver=1.2.2.r0.gaa01b31
pkgrel=1
pkgdesc="The single instruction language - Flip a bit, then Jump"
arch=("any")
provides=("flip-jump")
url="https://github.com/tomhea/flip-jump"
license=("BSD-2-Clause")
depends=("python" "python-sly")
makedepends=("git" "python-poetry")
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
    git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

prepare() {
    git -C "${_pkgname}" submodule update --init --recursive
}

build() {
    cd "${_pkgname}" || exit 1
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}" || exit 1
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
