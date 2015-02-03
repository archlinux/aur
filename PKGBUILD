# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.94.2
pkgrel=1
pkgdesc='A new browser for our friends (weekly snapshot)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
source=("https://vivaldi.com/download/snapshot/vivaldi.${pkgver}_snapshot.deb")
#depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info')
#optdepends=('ffmpeg: playback of proprietary formats')
provides=('vivaldi')

package() {
	tar -xf data.tar.xz --exclude={usr/share/{lintian,menu},etc} -C "$pkgdir/"

	# soname fix for libsystemd (udev)
	sed -e 's/libudev.so.0/libudev.so.1/g' \
		-i "$pkgdir/opt/vivaldi-unstable/vivaldi-bin"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi-unstable/vivaldi-sandbox"

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi-unstable/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
	done
}

sha256sums=('359eabcc4c9f089f87c43c24dc8d1d4218212642e953c073771a1d863f598906')
sha256sums=('37ae3f105214f25662dead3f8d389b43f6a2f664a98eac684d0fcf779461cce1')
