# Maintainer: edwloef

pkgname=flow-control
_pkgname=flow
pkgver=0.5.0
pkgrel=1
pkgdesc="a programmer's text editor"
arch=('x86_64')
url="https://github.com/neurocyte/$_pkgname"
license=('MIT')
optdepends=('ripgrep: project-wide search')
makedepends=('zig>=0.14.0' 'zig<0.15.0')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/neurocyte/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("1c69b69df208c92327641dd7b11fe293aa8d72cfc27f6b43d975114b60b52166")

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
