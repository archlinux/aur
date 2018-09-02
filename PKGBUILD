# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libva-git
pkgver=2.2.1.pre1.20180831.r0.gb6c50da
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux (git version)'
arch=('i686' 'x86_64')
url='https://01.org/linuxmedia/vaapi/'
license=('MIT')
depends=('libdrm' 'libgl' 'libx11' 'libxext' 'libxfixes' 'wayland')
makedepends=('git' 'libglvnd' 'mesa' 'meson')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards')
provides=('libva' 'libva-drm.so' 'libva-glx.so' 'libva-wayland.so'
          'libva-x11.so' 'libva.so')
conflicts=('libva')
source=("$pkgname"::'git+https://github.com/intel/libva.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^libva\.//;s/^v//'
}

build() {
    cd "$pkgname"
  
    arch-meson . build
    ninja -C build
}

package() {
    cd "$pkgname"
    
    DESTDIR="$pkgdir" ninja -C build install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
