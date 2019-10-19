# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=chestnut
pkgver=0.0.5
pkgrel=1
pkgdesc="An open-source NLE video editor "
arch=(x86_64)
url="https://github.com/jonno85uk/chestnut"
license=('GPL2')
groups=()
depends=('ffmpeg' 'qt5-base')
makedepends=('git') 
provides=("${pkgname%}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=('chestnut::git+https://github.com/jonno85uk/chestnut.git#commit=4c90e4e')
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
