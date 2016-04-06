# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
pkgver=1.0.435.38
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind.'
url="https://vivaldi.com"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'google-chrome: Widevine DRM Plugin'
)
source_i686=("https://vivaldi.com/download/stable/vivaldi-stable-${pkgver}-1.i386.rpm")
source_x86_64=("https://vivaldi.com/download/stable/vivaldi-stable-${pkgver}-1.x86_64.rpm")
sha256sums_i686=('4bc4e51bfdda327d2c64168bfbbede6cd51d1d30bc9a86ed3e0275ca9a341093')
sha256sums_x86_64=('c36250a76b3e78dafa513204a354a88ec8695e340d79b47934f8a3504e303a43')

package() {
    cp -a {opt,usr} "$pkgdir"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
	done
}

