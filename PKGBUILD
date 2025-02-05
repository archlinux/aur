# Maintainer: edwloef

pkgname=flow-control-git
_pkgname=flow-control
__pkgname=flow
pkgver=r1174.f5e3e84
pkgrel=2
pkgdesc="a programmer's text editor"
arch=('x86_64')
url="https://github.com/neurocyte/$__pkgname"
license=('MIT')
optdepends=('ripgrep: project-wide search')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/neurocyte/$__pkgname.git"
        "https://ziglang.org/builds/zig-linux-x86_64-0.14.0-dev.3046+08d661fcf.tar.xz")
sha256sums=(SKIP
            "ece2d77f9f810e766d58274d72238f4f3c286007fe8538ac6f23c41b6732e531")

pkgver() {
    cd "${__pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${__pkgname}"

    ../zig-linux-x86_64-0.14.0-dev.3046+08d661fcf/zig build -Doptimize=ReleaseFast
}

package() {
    cd "${__pkgname}"

    install -Dm755 "zig-out/bin/${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "contrib/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "contrib/icons/192x192/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
