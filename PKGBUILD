pkgname=colobot-gold
pkgver=0.2.2_alpha
_data_ver=0.2.2_alpha
_ver=0.2.2-alpha
pkgrel=3
pkgdesc="Colobot GOLD is a real-time strategy game with programmable bots."
arch=('i686' 'x86_64')
url="http://colobot.info"
license=('GPL3')
depends=('libsndfile' 'glew' 'sdl2' 'libvorbis' 'libpng' 'libogg' 'gettext' 'libgl' 'sdl2_image' 'sdl2_ttf' 'boost-libs' 'openal' "colobot-gold-data=$_data_ver" 'physfs')
makedepends=('cmake' 'boost' 'po4a' 'perl-pod-parser')
source=("https://github.com/colobot/colobot/archive/colobot-gold-$_ver.zip"
        "extern_main.patch")
md5sums=('6595010b402555c1250723a19243d223'
         '9715b88ed7e3076a38ae0419a96b0732')
sha1sums=('2883f799f1374e5a87cedd0fd1b5b9e415ef21b5'
          'a82be8e8e4439735f6fdfceba915e5ad7e72503b')
_archive_dir="colobot-colobot-gold-$_ver"
install=colobot.install

prepare() {
    patch -p1 -i extern_main.patch
}

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
