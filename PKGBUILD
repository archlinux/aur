# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265-git
pkgver=1.0.2.r174.g1df1dfe3
pkgrel=1
pkgdesc='Open H.265 video codec implementation (git version)'
arch=('i686' 'x86_64')
url='https://github.com/strukturag/libde265/'
license=('LGPL3')
depends=('gcc-libs')
makedepends=('git')
provides=('libde265')
conflicts=('libde265')
source=("$pkgname"::'git+https://github.com/strukturag/libde265.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    ./autogen.sh
    
    ./configure \
        --prefix='/usr' \
        --enable-shared='yes' \
        --enable-static='no' \
        --enable-fast-install='yes' \
        --enable-sse \
        --disable-dec265 \
        --disable-sherlock265
    
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
