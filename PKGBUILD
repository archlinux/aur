# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=frei0r-plugins-git
pkgver=1.6.0.r5.gdfd4475
pkgrel=3
pkgdesc='A minimalistic plugin API for video effects (git version)'
arch=('i686' 'x86_64')
url='https://www.dyne.org/software/frei0r/'
license=('GPL')
depends=('cairo' 'gavl')
makedepends=('git' 'opencv')
optdepends=('opencv: for facebl0r and facedetect plugins')
provides=('frei0r-plugins')
conflicts=('frei0r-plugins')
source=("$pkgname"::'git+https://github.com/dyne/frei0r.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf '%s' "$(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
}

build() {
    cd "$pkgname"
    
    ./autogen.sh
    
    ./configure \
        --prefix='/usr' \
        --enable-static='no' \
        --enable-shared='yes' \
        --enable-fast-install='yes' \
        --enable-cpuflags
    
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
