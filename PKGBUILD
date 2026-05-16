# Maintainer: mia <mia@mia.jetzt>
pkgname=gmelons
pkgver=1
pkgrel=1
pkgdesc="Melon Café FM player written with GJS"
arch=("any")
url="https://git.sr.ht/~conger/gmelons"
license=("ISC")
depends=("gjs" "gtk4" "libadwaita" "gstreamer" "gst-plugins-base" "gst-plugins-good")
makedepends=("esbuild")
source=("https://git.sr.ht/~conger/gmelons/archive/v${pkgver}.tar.gz")
sha256sums=("7aeba170622a011ec3d5d3e85942e13f187d080c44b0f37a062b73eda8de9eb3")

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
