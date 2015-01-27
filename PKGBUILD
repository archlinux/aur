# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=vivaldi
pkgver=1.0.83.38
pkgrel=2
pkgdesc='A new browser for our friends'
url="https://vivaldi.com"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
source=("https://vivaldi.com/download/Vivaldi_TP_$pkgver-1_amd64.deb")

package() {
	depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info')

	optdepends=(
		'ffmpeg: playback of not really open formats'
	)

	tar -xf data.tar.xz --exclude=usr/share/{lintian,menu} -C "$pkgdir/"

    # soname fix for libsystemd (udev)
    sed -e 's/libudev.so.0/libudev.so.1/g' \
        -i "$pkgdir/opt/vivaldi/vivaldi-bin"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

}

sha256sums=('359eabcc4c9f089f87c43c24dc8d1d4218212642e953c073771a1d863f598906')
