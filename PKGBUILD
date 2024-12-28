# Maintainer: edwloef

pkgname=flow-control
_pkgname=flow
pkgver=0.2.1
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
sha256sums=('826097db34fe8ed012a0409872b1d46f9aa950949c551faf82a6c3f2b184532d')

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
