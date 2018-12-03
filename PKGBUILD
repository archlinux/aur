# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265-git
_srcname=libde265
pkgver=1.0.3.r31.g4488ae0c
pkgrel=1
pkgdesc='Open H.265 video codec implementation (git version)'
arch=('i686' 'x86_64')
url='https://github.com/strukturag/libde265/'
license=('LGPL3')
depends=('gcc-libs')
makedepends=('git' 'ffmpeg' 'sdl' 'qt5-base')
optdepends=('ffmpeg: for sherlock265'
            'qt5-base: for sherlock265'
            'sdl: for dec265 YUV overlay output')
provides=('libde265')
conflicts=('libde265')
source=('git+https://github.com/strukturag/libde265.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    ./autogen.sh
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    ./configure \
        --prefix='/usr' \
        --enable-static=no \
        --enable-sse
        
    make
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
}
