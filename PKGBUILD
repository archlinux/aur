pkgname=colobot-gold
pkgver=0.1.6_alpha
__ver=0.1.6-alpha
pkgrel=2
pkgdesc="Colobot GOLD is a real-time strategy game with programmable bots."
arch=('i686' 'x86_64')
url="http://colobot.info"
license=('GPL3')
depends=('libsndfile' 'glew' 'sdl' 'libvorbis' 'libpng' 'libogg' 'gettext' 'libgl' 'sdl_image' 'sdl_ttf' 'boost-libs' 'openal' "colobot-gold-data=$pkgver" 'physfs')
makedepends=('cmake'  'boost')
source=("https://github.com/colobot/colobot/archive/colobot-gold-$__ver.zip")
md5sums=('385bec3a6b732c185e3c0efcbcf6f1a3')
sha1sums=('c6c2a5b85d5495133c0da4a8b815d1007024b8a8')
_archive_dir="colobot-colobot-gold-$__ver"
install=colobot.install

build() {
    mkdir -p "$srcdir/$_archive_dir/build"
    cd "$srcdir/$_archive_dir/build"
    cmake "$srcdir/$_archive_dir" -DCMAKE_BUILD_TYPE=release -DOPENAL_SOUND=1 -DASSERTS=1 -DDEV_BUILD=0 -DCMAKE_INSTALL_PREFIX="/usr" -DCOLOBOT_INSTALL_BIN_DIR="/usr/bin"
    make
}

package() {
    cd "$srcdir/$_archive_dir/build"
    make DESTDIR="$pkgdir/" install
}
