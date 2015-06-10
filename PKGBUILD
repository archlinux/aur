pkgname=colobot-gold
pkgver=0.1.5_alpha
__ver=0.1.5-alpha
pkgrel=1
pkgdesc="Colobot GOLD is a real-time strategy game with programmable bots."
arch=('i686' 'x86_64')
url="http://colobot.info"
license=('GPL3')
depends=('libsndfile' 'glew' 'sdl' 'libvorbis' 'libpng' 'libogg' 'gettext' 'libgl' 'sdl_image' 'sdl_ttf' 'boost-libs' 'openal' "colobot-gold-data=$pkgver" 'physfs')
makedepends=('cmake'  'boost')
source=("https://github.com/colobot/colobot/archive/colobot-gold-$__ver.zip")
md5sums=('b0865d16dc05266fec785bcda259c568')
sha1sums=('53db313051245a800b6dfae7534fa3428aec46ca')
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
