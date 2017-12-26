# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libva-git
pkgver=2.0.0.r44.g68a4bef
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux (git version)'
arch=('i686' 'x86_64')
url='https://01.org/linuxmedia/vaapi/'
license=('MIT')
depends=('glibc' 'libdrm' 'libgl' 'libx11' 'libxext' 'libxfixes' 'wayland')
makedepends=('git' 'mesa')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards')
provides=('libva' 'libva-drm.so' 'libva-glx.so' 'libva-wayland.so'
          'libva-x11.so' 'libva.so')
conflicts=('libva')
source=("$pkgname"::'git+https://github.com/01org/libva.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^libva\.//;s/^v//'
}

build() {
    cd "$pkgname"
  
    ./autogen.sh
    ./configure --prefix='/usr'
    make
}

package() {
    cd "$pkgname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
