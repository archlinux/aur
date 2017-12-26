# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libva-utils-git
pkgver=2.0.0.r22.g7b4827e
pkgrel=1
pkgdesc='Intel VA-API Media Applications and Scripts for libva (git version)'
arch=('i686' 'x86_64')
url='https://github.com/01org/libva-utils/'
license=('custom')
depends=('libva')
makedepends=('git' 'mesa')
provides=('libva-utils')
conflicts=('libva-utils')
source=("$pkgname"::'git+https://github.com/01org/libva-utils.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    ./autogen.sh \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        --localstatedir='/var'
    
    make
}

package() {
    cd "$pkgname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
