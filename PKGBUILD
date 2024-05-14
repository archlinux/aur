# Maintainer: Helle Vaanzinn <glitsj16@riseup.net>

_pkgname=nhex
pkgname=${_pkgname}-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A next-generation IRC client inspired by HexChat"
arch=(x86_64)
url="https://github.com/nhexirc/nhex"
license=('MIT' 'MPL-2.0')
depends=(
    gcc-libs
)
provides=("$_pkgname")
conflicts=("$_pkgname")
_deb="${_pkgname}_${pkgver}_amd64.deb"
source=("${_deb}::${url}/releases/download/v${pkgver}/${_deb}"
    "${_pkgname}.png::${url}/raw/main/packages/client/public/${_pkgname}.png")
sha256sums=('d1040be6be36e29f87ffba10a55b1071249917d2e2592df031c125f6296f4118'
            '5e8dca9809819d071e77a1e2cbf3ef255fc3e13e9e75064fbcf1be4be423e253')

prepare() {
    cd "$srcdir"
    ar p "$_deb" data.tar.gz | bsdtar xf -
}

package() {
    cd "$srcdir"
    install -Dm 755 "usr/bin/${_pkgname}" -t "$pkgdir"/usr/bin
    install -Dm 644 "${_pkgname}.png" -t "$pkgdir"/usr/share/pixmaps
    install -Dm 644 "usr/share/applications/${_pkgname}.desktop" -t "$pkgdir"/usr/share/applications
}
