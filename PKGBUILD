# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=chestnut
pkgver=0.1.1
pkgrel=1
pkgdesc="An open-source NLE video editor "
arch=(x86_64)
url="https://github.com/jonno85uk/chestnut"
license=('GPL3')
groups=()
depends=('ffmpeg' 'qt5-base' 'qt5-multimedia')
makedepends=('git' 'pkgconfig') 
provides=("${pkgname%}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=('https://github.com/jonno85uk/chestnut/archive/v0.1.1.tar.gz')
noextract=()
md5sums=('7fc612bc1c17c05deb5493183d6b36fc')

prepare() {
    rm -rf "chestnut"
    tar xaf v0.1.1.tar.gz
    mv chestnut-0.1.1 chestnut
    cd chestnut
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
