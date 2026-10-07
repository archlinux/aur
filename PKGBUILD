# Maintainer: Stéphane Jourdois <stephane@jourdois.fr>
# Rename to PKGBUILD when publishing the wlr-utils-bin AUR package.
pkgname=wlr-utils-bin
pkgver=1.11.1
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
_archive="wlr-utils-$CARCH-unknown-linux-gnu"
source=("$_archive-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('754fc7deb4728c0420657fc548c228f359560449f39d346d55b3982208fbaf98')

package() {
	# The cargo-dist archive unpacks into a single top-level directory named after
	# the target triple, holding the binaries and the files its install script needs.
	cd "$_archive"
	DESTDIR="$pkgdir" PREFIX=/usr LICENSEDIR="/usr/share/licenses/$pkgname" sh install.sh
}
