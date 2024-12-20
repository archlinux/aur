# Maintainer: edwloef

pkgname=flow-control
_pkgname=flow
pkgver=0.2.0
pkgrel=1
pkgdesc="a programmer's text editor"
arch=('x86_64')
url="https://github.com/neurocyte/flow"
license=('MIT')
optdepends=('ripgrep: project-wide search')
makedepends=('zig>=0.13.0' 'zig<0.14.0')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$_pkgname-v$pkgver.tar.gz::https://github.com/neurocyte/flow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9ce8fc5a7466e7c97b16b45a6e145e9feb9c3a8190d70d0efd45522942a2073d')

build() {
    cd "$_pkgname-$pkgver"

    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$_pkgname-$pkgver"

    install -Dm755 "zig-out/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "contrib/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "contrib/icons/192x192/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
