# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=libklvanc-git
pkgver=r434.d474cfc
pkgrel=1
pkgdesc='Library which can be used for parsing/generation of Vertical Ancillary Data (VANC) (git version)'
arch=('x86_64')
url='https://github.com/stoth68000/libklvanc/'
license=('LGPL')
depends=('ncurses')
makedepends=('git' 'zlib')
provides=('libklvanc')
conflicts=('libklvanc')
source=('git+https://github.com/stoth68000/libklvanc.git')
sha256sums=('SKIP')

prepare() {
    cd libklvanc
    
    ./autogen.sh --build
}

pkgver() {
    cd libklvanc
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd libklvanc
    
    ./configure \
        --prefix='/usr' \
        --enable-shared='yes' \
        --enable-static='no'
    
    make
}

package() {
    cd libklvanc
    
    make DESTDIR="$pkgdir" install
} 
