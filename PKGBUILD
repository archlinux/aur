# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=mujs
pkgver=1.0.3
pkgrel=1
pkgdesc='An embeddable Javascript interpreter in C'
arch=('i686' 'x86_64')
url='http://mujs.com/'
license=('ISC')
depends=('glibc')
conflicts=('mujs-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ccxvii/mujs/archive/${pkgver}.tar.gz")
sha256sums=('5aabafe512d7a7c6d2c8d67483a5331e55440eeca2db2dc4602ca643c62b5ef6')

build() {
    cd "${pkgname}-${pkgver}"
    make release
}

package() {
    cd "${pkgname}-${pkgver}"
    
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    
    make DESTDIR="$pkgdir" prefix='/usr' install-shared
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/mujs/LICENSE"
    install    -m644 docs/*  "${pkgdir}/usr/share/doc/${pkgname}"
}
