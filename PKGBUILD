pkgname=colobot-gold
pkgver=0.1.12_alpha
_data_ver=0.1.12_alpha
_ver=0.1.12-alpha
pkgrel=1
pkgdesc="Colobot GOLD is a real-time strategy game with programmable bots."
arch=('i686' 'x86_64')
url="http://colobot.info"
license=('GPL3')
depends=('libsndfile' 'glew' 'sdl2' 'libvorbis' 'libpng' 'libogg' 'gettext' 'libgl' 'sdl2_image' 'sdl2_ttf' 'boost-libs' 'openal' "colobot-gold-data=$_data_ver" 'physfs')
makedepends=('cmake'  'boost')
source=("https://github.com/colobot/colobot/archive/colobot-gold-$_ver.zip")
md5sums=('1ff2df226281a154a7dd47e96cf63db5')
sha1sums=('bd5274534ebb0131b7ecf9daa5b1878a5bedb037')
_archive_dir="colobot-colobot-gold-$_ver"
install=colobot.install

build() {
    mkdir -p "$srcdir/$_archive_dir/build"
    cd "$srcdir/$_archive_dir/build"
    cmake "$srcdir/$_archive_dir" -DCMAKE_BUILD_TYPE=release -DOPENAL_SOUND=1 -DASSERTS=1 -DDEV_BUILD=0 -DCMAKE_INSTALL_PREFIX="/usr" -DCOLOBOT_INSTALL_BIN_DIR="/usr/bin"  -DCMAKE_CXX_FLAGS="-Wno-stringop-truncation -Wno-error=format-overflow"
    make
}

package() {
    cd "$srcdir/$_archive_dir/build"
    make DESTDIR="$pkgdir/" install
}
