# Maintainer: Kritthapath Yaviraj <archlinux@toonshou.in>
# Maintainer: MidnightTale <mntale@pm.me>
# Based on helium-browser-bin (https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=helium-browser-bin)

pkgname="line-gtk"
pkgver=0.1.2
pkgrel=1
pkgdesc="Unofficial native LINE client for Linux. GTK4 / Libadwaita UI with a Deno protocol sidecar (linejs) - Prebuilt binary"
arch=('x86_64')
url="https://github.com/MidnightTale/Line-GTK"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'ffmpeg' 'hicolor-icon-theme')
optdepends=(
  'poppler: PDF preview in media viewer'
  'gst-plugins-good: extra video playback codecs'
  'gst-libav: extra video playback codecs'
)
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
source_x86_64=("${pkgname}-${pkgver}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${arch}.tar.gz")
sha256sums_x86_64=('28575f4db2543079b034898c326f78623a6c679e5a6f6024f0abc9ae63e774ed')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-${arch}"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -d "${pkgdir}/usr/share/${pkgname}"
	cp -a protocol "${pkgdir}/usr/share/${pkgname}/protocol"
	cp -a assets "${pkgdir}/usr/share/${pkgname}/assets"

	install -Dm644 "dev.linegtk.LineGtk.desktop" "${pkgdir}/usr/share/applications/dev.linegtk.LineGtk.desktop"

	for size in 48x48 64x64 128x128 256x256; do
		install -Dm644 "assets/icons/hicolor/${size}/apps/line-gtk.png" \
		"$pkgdir/usr/share/icons/hicolor/${size}/apps/line-gtk.png"
	done
	install -Dm644 assets/icons/hicolor/scalable/apps/line-gtk.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/line-gtk.svg"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
