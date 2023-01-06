pkgname=ponscripter-bin
pkgver=v3.0.2
_pkgver=`curl -s https://api.github.com/repos/07th-mod/ponscripter-fork/releases/latest|grep tag_name|cut -d\" -f4`
pkgrel=1
pkgdesc="Fork of the Ponscripter visual novel engine to take advantage of SDL2 and improve Steam integration"
arch=(x86_64 aarch64)
url=https://github.com/07th-mod/ponscripter-fork
license=(GPL)
depends=(sdl2_mixer freetype2)
depends_aarch64=(box64)
provides=(ponscripter)
conflicts=(ponscripter)
source=(`curl -s https://api.github.com/repos/07th-mod/ponscripter-fork/releases/latest|grep browser_download_url|cut -d\" -f4|grep 'linux\.'`)
md5sums=(SKIP)
pkgver(){
	echo $_pkgver
}
package(){
	[ $CARCH = x86_64 ] && install ponscr -Dt "$pkgdir"/usr/bin || {
		install ponscr -D "$pkgdir"/usr/bin/ponscr-x86_64
		echo -e '#!/bin/sh\nbox64 ponscr-x86_64 "$@"'>"$pkgdir"/usr/bin/ponscr	# force box64 if binfmt is missing
		chmod +x "$pkgdir"/usr/bin/ponscr
	}
}
