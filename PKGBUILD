pkgname=colobot-gold
pkgver=0.1.7b_alpha
_data_ver=0.1.7_alpha
_ver=0.1.7b-alpha
pkgrel=1
pkgdesc="Colobot GOLD is a real-time strategy game with programmable bots."
arch=('i686' 'x86_64')
url="http://colobot.info"
license=('GPL3')
depends=('libsndfile' 'glew' 'sdl2' 'libvorbis' 'libpng' 'libogg' 'gettext' 'libgl' 'sdl2_image' 'sdl2_ttf' 'boost-libs' 'openal' "colobot-gold-data=$_data_ver" 'physfs')
makedepends=('cmake'  'boost')
source=("https://github.com/colobot/colobot/archive/colobot-gold-$_ver.zip")
md5sums=('10a977e630c2ec7b4e657bd9a5ad4615')
sha1sums=('736e8d69877028e890e045c331465d19b9fec5b2')
_archive_dir="colobot-colobot-gold-$_ver"
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
