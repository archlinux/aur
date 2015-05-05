# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
pkgver=1.0.162.9
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind.'
url="https://vivaldi.com"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom')
arch=('x86_64' 'i686')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=('ffmpeg: playback of proprietary formats')
source_x86_64=("https://vivaldi.com/download/Vivaldi_TP3.${pkgver}-1_amd64.deb")
source_i686=("https://vivaldi.com/download/Vivaldi_TP3.${pkgver}-1_i386.deb")
sha256sums_x86_64=('8352cc1dd034f5061caf4611b887abbb09b98a8ac51e2a4e54a1d9584ed18ae6')
sha256sums_i686=('ca94148b98c510c5ca3ea07ab7caa886291613f05fddf2a0ba4c38df7bc7fab0')

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

