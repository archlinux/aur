# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libraqm
pkgver=0.2.0
pkgrel=2
pkgdesc='A library that encapsulates the logic for complex text layout'
arch=('i686' 'x86_64')
url='https://github.com/HOST-Oman/libraqm/'
license=('MIT')
depends=('freetype2' 'harfbuzz' 'fribidi')
makedepends=('gtk-doc')
provides=('libraqm.so')
conflicts=('libraqm-git')
source=("$pkgname"-"$pkgver".tar.gz::"https://github.com/HOST-Oman/libraqm/archive/v${pkgver}.tar.gz")
sha256sums=('a12a8428e18b4e35b4984a8f5afc225c8ec0ca7aeb64455a47671316c3e29cdb')

prepare() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    
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
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
