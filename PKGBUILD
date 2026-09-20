# Maintainer: Hash <elpoepstudios@gmail.com>
# Contributor: none

pkgname=elpaudio-mini
pkgdesc="Simple audio player, written on GameBreaker"
pkgver=0.0.4
pkgrel=1
arch=(x86_64)
url="https://codeberg.org/elpAudio/elpAudioMini"
license=(BSD-3)
depends=(gamebreaker-sdl3)
provides=('elpaudio-mini')
conflicts=()
makedepends=(make)
source=("elpAudioMini-${pkgver}.tar.gz::https://codeberg.org/elpAudio/elpAudioMini/archive/v${pkgver}.tar.gz")
md5sums=('b4d028b806f01545e75022debb73f388')

build() {
	rename "elpaudiomini" "elpaudio-mini-${pkgver}" "${srcdir}/elpaudiomini"
	cd "${srcdir}/elpaudio-mini-${pkgver}"
	make
}

package(){
	cd "${srcdir}/elpaudio-mini-${pkgver}"

	mkdir -p "$pkgdir/opt/elpaudio-mini/"
	mkdir -p "$HOME/.eamini/resources"
	mkdir -p "$HOME/.eamini/themes/default"
	mkdir -p "$HOME/.eamini/playlists"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps/"
	
	cp -drf resources/* "$HOME/.eamini/resources"
	cp -drf themes/* "$HOME/.eamini/themes"
	cp "elpaudio-mini" "$pkgdir/opt/elpaudio-mini/"
	cp "$pkgdir/../../gb.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/elpaudio-mini.png"
	cp "$pkgdir/../../elpaudio-mini.desktop" "$pkgdir/usr/share/applications/elpaudio-mini.desktop"
	
	echo elpAudioMini was installed to /opt/elpAudioMini
}

post_install(){
	chmod +x /opt/elpaudio-mini/elpaudio-mini
}
