# Maintainer: gigas002 <gigas002@pm.me>

_pkgname=vangers
pkgname=$_pkgname-git
pkgver=r714.fb18b93
pkgrel=3
pkgdesc="The video game that combines elements of the racing and role-playing genres"
arch=('x86_64')
url="https://github.com/KranX/$_pkgname"
license=('GPL3')
makedepends=('git' 'cmake' 'make' 'ffmpeg' 'clunk-vangers-git' 'sdl2' 'sdl2_net' 'libogg' 'libvorbis' 'zlib')
depends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_pkgname
    cmake \
        -B build \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBINARY_SCRIPT=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    install -d $pkgdir/usr/bin
    cp $srcdir/$_pkgname/build/src/$_pkgname $pkgdir/usr/bin/$_pkgname
    echo "Build complete, please create link to game directory from /usr/bin/$_pkgname"
}
