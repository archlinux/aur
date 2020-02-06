# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=chestnut
pkgver=0.2.1
pkgrel=3
pkgdesc="An open-source NLE video editor "
arch=(x86_64)
url="https://github.com/jonno85uk/chestnut"
license=('GPL3')
groups=()
depends=('ffmpeg' 'qt5-base' 'qt5-multimedia' 'mediahandling' 'audiowaveform')
makedepends=('git' 'pkgconfig') 
provides=("${pkgname%}")
conflicts=('chestnut-git')
replaces=()
backup=()
options=()
install=
source=("https://github.com/jonno85uk/chestnut/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('05e8bc2229eae7335c3b81f13be4e3c6')

prepare() {
    rm -rf "chestnut"
    tar xaf v${pkgver}.tar.gz
    mv chestnut-${pkgver} chestnut
    cd chestnut
    qmake CONFIG+=release    
}

build() {
    cd "$srcdir/chestnut"
    make
}

check() {
    cd "$srcdir"
}

package() {
    cd "$srcdir/chestnut"
    strip app/main/build/release/chestnut
    make INSTALL_ROOT=${pkgdir} install   
}
