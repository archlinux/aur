# Maintainer: Hash <elpoepstudios@gmail.com>
# Contributor: none

pkgname=elpaudio-mini
pkgdesc="Simple audio player, written on GameBreaker"
pkgver=0.0.2
pkgrel=1
arch=(x86_64)
url="https://codeberg.org/elpAudio/elpAudioMini"
license=(BSD-3)
depends=(gamebreaker-sdl3)
provides=('elpaudio-mini')
conflicts=()
makedepends=(make)
source=("elpAudioMini-${pkgver}.tar.gz::https://codeberg.org/elpAudio/elpAudioMini/archive/v${pkgver}.tar.gz")
md5sums=('ba87dd1f880068aa5113dc593f891a03')

build() {
	rename "elpaudiomini" "elpaudio-mini-${pkgver}" "${srcdir}/elpaudiomini"
	cd "${srcdir}/elpaudio-mini-${pkgver}"
	make
}

package(){
	cd "${srcdir}/elpaudio-mini-${pkgver}"

	mkdir -p "$pkgdir/opt/elpaudio-mini/"
	mkdir -p "$pkgdir/opt/elpaudio-mini/resources"
	mkdir -p "$pkgdir/opt/elpaudio-mini/themes/default"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps/"
	
	cp -drf resources/* "$pkgdir/opt/elpaudio-mini/resources"
	cp -drf themes/* "$pkgdir/opt/elpaudio-mini/themes"
	cp "elpaudio-mini" "$pkgdir/opt/elpaudio-mini/"
	cp "$pkgdir/../../gb.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/elpaudio-mini.png"
	cp "$pkgdir/../../elpaudio-mini.desktop" "$pkgdir/usr/share/applications/elpaudio-mini.desktop"
	
	echo elpAudioMini was installed to /opt/elpAudioMini
}

post_install(){
	chmod +x -R /opt/elpaudio-mini
}
