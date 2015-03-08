# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
pkgver=1.0.118.19
pkgrel=1
pkgdesc='A new browser for our friends'
url="https://vivaldi.com"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom')
arch=('x86_64' 'i686')
source_x86_64=("https://vivaldi.com/download/vivaldi-preview_${pkgver}-1_amd64.deb")
source_i686=("https://vivaldi.com/download/vivaldi-preview_${pkgver}-1_i386.deb")
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
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

sha256sums_x86_64=('f7f9ba45c303d1461a6ff28548300bdf0d4c066c007999e8a0d945a734316a60')
sha256sums_i686=('5040d0fcda3dc76cd621439b7b54253e5bd57ef08789b2f17b1a7de54ee135fe')
