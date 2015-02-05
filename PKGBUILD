# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
pkgver=1.0.94.2
pkgrel=1
pkgdesc='A new browser for our friends'
url="https://vivaldi.com"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
source=("https://vivaldi.com/download/Vivaldi_TP2_${pkgver}_amd64.deb")
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info')
optdepends=('ffmpeg: playback of proprietary formats')

package() {
	tar -xf data.tar.xz --exclude={etc,usr/share/{lintian,menu}} -C "$pkgdir/"

	# soname fix for libsystemd (udev)
	sed -e 's/libudev.so.0/libudev.so.1/g' \
		-i "$pkgdir/opt/vivaldi/vivaldi-bin"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
	done
}

sha256sums=('9fcf99ba06fc74cd01329611cf70765349c1301a2fc6bf8cff8dc84eddb7ea48')
