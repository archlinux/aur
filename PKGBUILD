# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=mujs
pkgver=1.0.0
pkgrel=1
pkgdesc='An embeddable Javascript interpreter in C'
arch=('i686' 'x86_64')
url='http://mujs.com/'
license=('ISC')
depends=('glibc')
conflicts=('mujs-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ccxvii/mujs/archive/${pkgver}.tar.gz")
sha256sums=('0691ae7c5154263c7777d38dfcac6db5c5a4c9d5afb9a782858563064b86cbe4')

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
