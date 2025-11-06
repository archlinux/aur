# Maintainer: edwloef

pkgname=flow-control
_pkgname=flow
pkgver=0.6.0
pkgrel=1
pkgdesc="a programmer's text editor"
arch=('x86_64')
url="https://github.com/neurocyte/$_pkgname"
license=('MIT')
optdepends=('ripgrep: project-wide search')
makedepends=('zig>=0.15.0' 'zig<0.16.0')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/neurocyte/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("cdfb954092e41b3676a3ee3e2d10406b2cd1590304e1492f560c0bab66ef99e3")

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
