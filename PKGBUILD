# See contacts at https://aur.archlinux.org/cgit/aur.git/tree/README.md?h=lazyports-git

pkgname=lazyports-git
_pkgname=lazyports
_reponame=LazyPorts
pkgver=r34.84647db
pkgrel=2
pkgdesc="A terminal UI tool to visualize and manage network ports"
arch=("any")
url="https://github.com/v9mirza/LazyPorts"
license=("MIT")
depends=()
makedepends=("go" "git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/v9mirza/LazyPorts.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_reponame}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_reponame}"

    CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o "./build/${_pkgname}"
}

package() {
    cd "${srcdir}/${_reponame}"

    install -Dm755 "./build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
