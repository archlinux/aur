# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=mujs
pkgver=1.0.2
pkgrel=1
pkgdesc='An embeddable Javascript interpreter in C'
arch=('i686' 'x86_64')
url='http://mujs.com/'
license=('ISC')
depends=('glibc')
conflicts=('mujs-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ccxvii/mujs/archive/${pkgver}.tar.gz")
sha256sums=('a420321e47d348e56ffdaa8c82e1c38a882e2a12fc855d53fff3b6e51b92a4a7')

build() {
    cd "${pkgname}-${pkgver}"
    make VERSION="$pkgver" prefix='/usr' release
}

package() {
    cd "${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    
    make DESTDIR="$pkgdir" prefix='/usr' install-shared
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/mujs/LICENSE"
    install    -m644 docs/*  "${pkgdir}/usr/share/doc/${pkgname}"
}
