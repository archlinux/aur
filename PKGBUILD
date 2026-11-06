# Maintainer: Hash <elpoepstudios@gmail.com>
# Contributor: none

pkgname=elpaudio-mini
pkgdesc="Simple audio player, written on GameBreaker"
pkgver=0.0.8
pkgrel=1
arch=(x86_64)
url="https://codeberg.org/elpAudio/elpAudioMini"
license=(BSD-3)
depends=(gamebreaker-sdl3)
provides=('elpaudio-mini')
conflicts=()
makedepends=(make)
source=("elpAudioMini-${pkgver}.tar.gz::https://codeberg.org/elpAudio/elpAudioMini/archive/v${pkgver}.tar.gz")
md5sums=('2ff4c0e001b25b242ae85a5dc0f486ca')

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
	mkdir -p "$HOME/.eamini/visualisers"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps/"
	
	cp -drf resources/* "$HOME/.eamini/resources"
	cp -drf themes/* "$HOME/.eamini/themes"
	cp -drf visualisers/* "$HOME/.eamini/visualisers"
	cp "elpaudio-mini" "$pkgdir/opt/elpaudio-mini/"
	cp "$pkgdir/../../gb.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/elpaudio-mini.png"
	cp "$pkgdir/../../elpaudio-mini.desktop" "$pkgdir/usr/share/applications/elpaudio-mini.desktop"
	
	echo elpAudioMini was installed to /opt/elpAudioMini
}
