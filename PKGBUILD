# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
pkgver=1.0.94.2
pkgrel=2
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
		-i "$pkgdir/opt/vivaldi-unstable/vivaldi-bin"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi-unstable/vivaldi-sandbox"

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi-unstable/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-unstable.png"
	done
}

sha256sums=('37ae3f105214f25662dead3f8d389b43f6a2f664a98eac684d0fcf779461cce1')
