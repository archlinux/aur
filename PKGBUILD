# Maintainer: gigas002 <gigas002@pm.me>

pkgname=vangers-git
_pkgname=vangers
pkgver=r641.48483ca
pkgrel=3
pkgdesc="The video game that combines elements of the racing and role-playing genres"
arch=('x86_64')
url="https://github.com/KranX/$_pkgname"
license=('GPL3')
makedepends=('git' 'cmake' 'make' 'ffmpeg4.4' 'clunk-vangers-git' 'sdl2' 'sdl2_net' 'libogg' 'libvorbis' 'zlib')
depends=()
provides=("vangers")
conflicts=('vangers')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_pkgname
    mkdir build && cd build
    # Force use ffmpeg4.4
    cmake -DCMAKE_PREFIX_PATH="/usr/lib/ffmpeg4.4;/usr/include/ffmpeg4.4" -DBINARY_SCRIPT=OFF ..
    make
}

package() {
    install -d $pkgdir/usr/bin
    cp $srcdir/$_pkgname/build/src/$_pkgname $pkgdir/usr/bin/vangers
    echo "Build complete, please create link to game directory from /usr/bin/vangers"
}
