# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libraqm-git
_srcname=libraqm
pkgver=0.5.0.r27.gb51b28b
pkgrel=1
pkgdesc='A library that encapsulates the logic for complex text layout (git version)'
arch=('i686' 'x86_64')
url='https://github.com/HOST-Oman/libraqm/'
license=('MIT')
depends=('freetype2' 'harfbuzz' 'fribidi')
makedepends=('git' 'gtk-doc')
provides=('libraqm' 'libraqm.so')
conflicts=('libraqm')
source=('git+https://github.com/HOST-Oman/libraqm.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    ./autogen.sh
}

pkgver() {
    cd "$_srcname"
    
    #git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
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
    cd "$_srcname"

    make DESTDIR="$pkgdir" install
    
    install -D -m644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
