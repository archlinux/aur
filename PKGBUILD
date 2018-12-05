# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libva-git
_srcname=libva
pkgver=2.2.1.pre1.20180921.r6.gcf11abe
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
source=('git+https://github.com/intel/libva.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^libva\.//;s/^v//'
}

build() {
    cd "$_srcname"
  
    arch-meson . build
    ninja -C build
}

package() {
    cd "$_srcname"
    
    DESTDIR="$pkgdir" ninja -C build install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
