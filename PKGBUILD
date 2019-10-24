# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=chestnut
pkgver=0.1.0
pkgrel=2
pkgdesc="An open-source NLE video editor "
arch=(x86_64)
url="https://github.com/jonno85uk/chestnut"
license=('GPL2')
groups=()
depends=('pkgconfig' 'ffmpeg' 'qt5-base' 'qt5-multimedia')
makedepends=('git') 
provides=("${pkgname%}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=('chestnut::git+https://github.com/jonno85uk/chestnut.git#commit=d46dbb5')
noextract=()
md5sums=('SKIP')

prepare() {
    cd "$srcdir/chestnut"
    qmake CONFIG+=release
    
}

build() {
    cd "$srcdir/chestnut"
    CORES=$(cat /proc/cpuinfo | grep -c "vendor_id")
    make -j${CORES} -l${CORES}
}

check() {
    cd "$srcdir"
}

package() {
    cd "$srcdir/chestnut"
    strip app/main/build/release/chestnut
    make INSTALL_ROOT=${pkgdir} install   
}
