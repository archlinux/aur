# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.135.2
pkgrel=1
pkgdesc='A new browser for our friends (weekly snapshot)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
source_i686=("vivaldi-snapshot_${pkgver}-1_i386.deb::https://vivaldi.com/download/download.php?f=vivaldi-snapshot_${pkgver}-1_i386.deb")
source_x86_64=("vivaldi-snapshot_${pkgver}-1_amd64.deb::https://vivaldi.com/download/download.php?f=vivaldi-snapshot_${pkgver}-1_amd64.deb")
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=('ffmpeg: playback of proprietary formats')
conflicts=('vivaldi')

package() {
	tar -xf data.tar.xz --exclude={usr/share/{lintian,menu},etc} -C "$pkgdir/"

	# soname fix for libsystemd (udev)
	sed -e 's/libudev.so.0/libudev.so.1/g' \
		-i "$pkgdir/opt/vivaldi-snapshot/vivaldi-bin"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi-snapshot/vivaldi-sandbox"

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi-snapshot/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-snapshot.png"
	done
}

sha256sums_i686=('c1a62bb5e2cabdd8fc0225b44f76b724e2664bc9e4c2b387b987716928c8b526')
sha256sums_x86_64=('903fb6fa3f2f2f513eea28faadc722f3cafe41643e68a87ed489cda6bcd3e519')
sha256sums_i686=('009b68993d1c67710bde0d5fe1c429aebcc6da153d858549b37de1ee20dc835e')
sha256sums_x86_64=('d1eee11983f39ee8e3bce3b2d32dfb0023b5c1bae39f446d595c1c571984762c')
