# Maintainer: Stéphane Jourdois <stephane@jourdois.fr>
# Rename to PKGBUILD when publishing the wlr-utils-bin AUR package.
pkgname=wlr-utils-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='Native screen tools for wlroots compositors: pick, switch, capture, inspect and annotate (prebuilt binaries)'
arch=('x86_64')
url='https://github.com/sjourdois/wlr-utils'
license=('MIT' 'Apache-2.0')
# Same runtime libraries as the source package; the prebuilt binaries link them
# dynamically, so soname skew with your system may require the -from-source package.
depends=('wayland' 'libxkbcommon' 'fontconfig' 'libglvnd' 'mesa' 'ffmpeg' 'libva'
         'libpipewire' 'tesseract' 'leptonica' 'dbus')
optdepends=('noto-fonts-cjk: render CJK (Japanese/Chinese/Korean) text'
            'tesseract-data-eng: English OCR for `wlr-peek ocr`'
            'tesseract-data-fra: French OCR for `wlr-peek ocr`'
            'xdg-desktop-portal-wlr: screencast portal that drives wlr-chooser')
provides=('wlr-utils')
conflicts=('wlr-utils')
_archive="wlr-utils-x86_64-unknown-linux-gnu"
source=("$_archive-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('7de83210fbe5b1f5b33deded831577e530ee357f45940800685b246eb1de97d3')

package() {
	# The cargo-dist archive unpacks into a single top-level directory named after
	# the target triple, holding the five binaries plus the READMEs and licences.
	cd "$_archive"
	for _bin in wlr-chooser wlr-switcher wlr-peek wlr-shot wlr-draw; do
		install -Dm755 "$_bin" "$pkgdir/usr/bin/$_bin"
	done
	install -Dm644 README.md "$pkgdir/usr/share/doc/wlr-utils/README.md"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
