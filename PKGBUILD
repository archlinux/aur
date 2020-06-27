# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>
pkgname=glcs-git
pkgver=r511aeb71fa
pkgrel=3
pkgdesc="OpenGL and ALSA Screencast Tool, based in GLC"
arch=('i686' 'x86_64')
url="https://github.com/lano1106/glcs/"
license=('GPL3')
depends=("libpng" "alsa-lib" "libgl" "libxxf86vm")
makedepends=('git' 'cmake')
optdepends=()
provides=('glcs')
install=
changelog=
mods=("elfhacks" "packetstream" "../glcs")
backup=("usr/share/glcs/scripts/capture.sh"
		"usr/share/glcs/scripts/pipe_ffmpeg.sh"
		"usr/share/glcs/scripts/webcam_overlay_mix_audio.sh")
source=(glcs::git+https://github.com/lano1106/glcs.git)
md5sums=('SKIP')

prepare(){
	cd "${srcdir}/glcs"

	sed -i 's/nullkey/ienorand/' .gitmodules
	git submodule init
	git submodule update
}

build() {
	cd "${srcdir}/glcs"
	DESTDIR=$pkgdir/usr
	if [ $CARCH == "x86_64" ]; then
		CFLAGS="$CFLAGS -m64"
	fi
	./build.sh $DESTDIR || return 1;

}

package() {
	cd "${srcdir}/glcs"
	DESTDIR=$pkgdir/usr
	./package.sh $DESTDIR || return 1;
}

