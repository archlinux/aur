# Maintainer: Hannah
# Maintainer: FabioLolix
# Contributor: J.D. Broberg <jdbroberg72 at gmail dot com>

pkgname=odin-git
_pkgname=odin
pkgver=r4558.82736370
pkgrel=1
pkgdesc="compiler for the odin programming language"
arch=(x86_64)
url="https://github.com/odin-lang/odin"
license=(BSD)
depends=(glibc ncurses)
makedepends=(git clang llvm11)
provides=(odin)
conflicts=(odin)
source=("git+https://github.com/odin-lang/odin.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    make release
}

package() {
    cd "${_pkgname}"

    install -d "${pkgdir}/opt/${_pkgname}"
    install -Dm755 "./odin" "${pkgdir}/opt/${_pkgname}/odin"

    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_pkgname}/odin" "${pkgdir}/usr/bin/odin"

    cp -av "./core" "${pkgdir}/opt/${_pkgname}"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
