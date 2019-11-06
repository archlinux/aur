# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=chestnut
pkgver=0.1.2
pkgrel=1
pkgdesc="An open-source NLE video editor "
arch=(x86_64)
url="https://github.com/jonno85uk/chestnut"
license=('GPL3')
groups=()
depends=('ffmpeg' 'qt5-base' 'qt5-multimedia')
makedepends=('git' 'pkgconfig') 
provides=("${pkgname%}")
conflicts=('chestnut-git')
replaces=()
backup=()
options=()
install=
source=("https://github.com/jonno85uk/chestnut/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('c6b4754afd72c85251846c7c71a2b351')

prepare() {
    rm -rf "chestnut"
    tar xaf v${pkgver}.tar.gz
    mv chestnut-${pkgver} chestnut
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
