# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libraqm-git
pkgver=0.3.0.r1.ge046b04
pkgrel=1
pkgdesc='A library that encapsulates the logic for complex text layout'
arch=('i686' 'x86_64')
url='https://github.com/HOST-Oman/libraqm/'
license=('MIT')
depends=('freetype2' 'harfbuzz' 'fribidi')
makedepends=('git' 'gtk-doc')
provides=('libraqm' 'libraqm.so')
conflicts=('libraqm')
source=("$pkgname"::'git+https://github.com/HOST-Oman/libraqm.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    ./autogen.sh
    
    ./configure \
        --prefix='/usr' \
        --enable-static='no' \
        --enable-shared='yes' \
        --enable-fast-install='yes' \
        --enable-gtk-doc='yes' \
        --enable-gtk-doc-html='yes' \
        --enable-gtk-doc-pdf='no'
    
    make
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
