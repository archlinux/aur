# Maintainer: edwloef

pkgname=flow-control
_pkgname=flow
pkgver=0.3.3
pkgrel=1
pkgdesc="a programmer's text editor"
arch=('x86_64')
url="https://github.com/neurocyte/$_pkgname"
license=('MIT')
optdepends=('ripgrep: project-wide search')
makedepends=('zig>=0.13.0' 'zig<0.14.0')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/neurocyte/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("74f86b04645da075f0290d95f56d4ed663919b0123430b4c97222e3a012fbf73")

build() {
    cd "$_pkgname-$pkgver"

    zig build -Doptimize=ReleaseFast
}

package() {
    cd "$_pkgname-$pkgver"

    install -Dm755 "zig-out/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "contrib/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "contrib/icons/192x192/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
