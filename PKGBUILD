pkgname=ponscripter-bin
pkgver=4.0.0
pkgrel=1
pkgdesc='Fork of the Ponscripter visual novel engine to take advantage of SDL2 and improve Steam integration'
arch=(x86_64 aarch64)
url=https://github.com/07th-mod/ponscripter-fork
license=(GPL)
depends=(sdl2_mixer freetype2)
depends_aarch64=(box64)
provides=(ponscripter)
conflicts=($provides)
options=(!strip)
source=($url/releases/download/v$pkgver/ponscr-$pkgver-linux.zip)
noextract=(${source[0]##*/})
cksums=(SKIP)
package(){
	mkdir -p "$pkgdir"/usr/bin
	bsdtar xf ${source[0]##*/} -C"$pkgdir"/usr/bin
	[ $CARCH = x86_64 ] || {
		mv "$pkgdir"/usr/bin/ponscr{,.bin}
		echo -e '#!/bin/sh\nbox64 ponscr.bin "$@"'>"$pkgdir"/usr/bin/ponscr	# force box64 if binfmt is missing
		chmod +x "$pkgdir"/usr/bin/ponscr
	}
}
