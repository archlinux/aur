# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libva-utils-git
pkgver=2.2.1.pre1.20180921.r15.gfbb1720
pkgrel=1
pkgdesc='Intel VA-API media applications and scripts for libva (git version)'
arch=('i686' 'x86_64')
url='https://github.com/01org/libva-utils/'
license=('MIT')
depends=('libva' 'libx11' 'wayland')
makedepends=('git' 'meson' 'libdrm' 'libxext' 'libxfixes')
provides=('libva-utils')
conflicts=('libva-utils')
source=('git+https://github.com/intel/libva-utils.git')
sha256sums=('SKIP')

pkgver() {
    cd libva-utils
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd libva-utils
    
    arch-meson . build
    ninja -C build
}

package() {
    cd libva-utils
    
    DESTDIR="$pkgdir" ninja -C build install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
