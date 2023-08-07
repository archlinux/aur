pkgname=colobot-gold
pkgver=0.2.1_alpha
_data_ver=0.2.1_alpha
_ver=0.2.1-alpha
pkgrel=1
pkgdesc="Colobot GOLD is a real-time strategy game with programmable bots."
arch=('i686' 'x86_64')
url="http://colobot.info"
license=('GPL3')
depends=('libsndfile' 'glew' 'sdl2' 'libvorbis' 'libpng' 'libogg' 'gettext' 'libgl' 'sdl2_image' 'sdl2_ttf' 'boost-libs' 'openal' "colobot-gold-data=$_data_ver" 'physfs')
makedepends=('cmake' 'boost' 'pod2man' 'po4a' 'perl-pod-parser')
source=("https://github.com/colobot/colobot/archive/colobot-gold-$_ver.zip")
md5sums=('8d75990080a37e50fff68ef294767b31')
sha1sums=('fdf03737bc97bef5d29fae9f6213b4f4a3e8dadf')
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
