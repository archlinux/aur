# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=clipse-git
_pkgname=clipse
pkgver=r237.9e7bb6f
pkgrel=1
pkgdesc="Configurable TUI clipboard manager for Unix"
arch=("any")
url="https://github.com/savedra1/clipse"
license=("MIT")
makedepends=(
    "go"
    "git"
)
optdepends=(
    "xclip"
    "wl-clipboard"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    go mod tidy
    go build -o "${_pkgname}"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
