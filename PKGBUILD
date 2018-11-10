# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=libklvanc-git
_srcname=libklvanc
pkgver=r430.68c5c7d
pkgrel=1
pkgdesc='Library which can be used for parsing/generation of Vertical Ancillary Data (VANC) (git version)'
arch=('i686' 'x86_64')
url='https://github.com/stoth68000/libklvanc/'
license=('LGPL')
depends=('ncurses')
makedepends=('git' 'zlib')
provides=('libklvanc')
conflicts=('libklvanc')
source=('git+https://github.com/stoth68000/libklvanc.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    ./autogen.sh --build
}

pkgver() {
    cd "$_srcname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_srcname"
    
    ./configure \
        --prefix='/usr' \
        --enable-shared='yes' \
        --enable-static='no'
    
    make
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
} 
