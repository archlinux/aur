# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.151.7
pkgrel=1
pkgdesc='A new browser for our friends (weekly snapshot)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=('ffmpeg: playback of proprietary formats')
conflicts=('vivaldi')
source_i686=("vivaldi-snapshot_${pkgver}-1_i386.deb::https://vivaldi.com/download/download.php?f=vivaldi-snapshot_${pkgver}-1_i386.deb")
source_x86_64=("vivaldi-snapshot_${pkgver}-1_amd64.deb::https://vivaldi.com/download/download.php?f=vivaldi-snapshot_${pkgver}-1_amd64.deb")
sha256sums_i686=('9dcd45ff60bc2dfc92a173459fe757f9b645d49cdf64baadb6cd6f769d7ecfc7')
sha256sums_x86_64=('d2e0ab75735ebf6545269b7841789d739de975a96d0cdcd3436745a84472a99c')

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

