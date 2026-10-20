# Maintainer: edwloef

pkgname=flow-control-git
_pkgname=flow-control
__pkgname=flow
pkgver=r4568.262f4041
pkgrel=1
pkgdesc="a programmer's text editor"
arch=('x86_64')
url="https://github.com/neurocyte/$__pkgname"
license=('MIT')
optdepends=('ripgrep: project-wide search')
makedepends=('git' 'zig>=0.17.0' 'zig<0.18.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/neurocyte/$__pkgname.git")
sha256sums=(SKIP)

pkgver() {
    cd "${__pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${__pkgname}"

    zig build -Doptimize=fast
}

package() {
    cd "${__pkgname}"

    install -Dm755 "zig-out/bin/${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dDm644 "contrib/share" "${pkgdir}/usr/share"
}
