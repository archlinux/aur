# Maintainer: mia <mia@mia.jetzt>
pkgname=gmelons
pkgver=2
pkgrel=1
pkgdesc="Melon Café FM player written with GJS"
arch=("any")
url="https://git.sr.ht/~conger/gmelons"
license=("ISC")
depends=("gjs" "gtk4" "libadwaita" "gstreamer" "gst-plugins-base" "gst-plugins-good")
makedepends=("esbuild")
source=("https://git.sr.ht/~conger/gmelons/archive/v${pkgver}.tar.gz")
sha256sums=("7a146c6f2bc3a47a10fea279f4a7e3cc958b877ae755a7884538a9b8ab322426")

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    esbuild app.ts --outfile=app.js --log-level=warning
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    install -Dm755 app.js "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 jetzt.mia.GMelons.desktop "${pkgdir}/usr/share/applications/jetzt.mia.GMelons.desktop"
    install -Dm644 icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/jetzt.mia.GMelons.svg"
}
