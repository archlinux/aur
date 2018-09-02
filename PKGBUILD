# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libva-utils-git
pkgver=2.2.0.pre1.r2.g9a10ad6
pkgrel=1
pkgdesc='Intel VA-API Media Applications and Scripts for libva (git version)'
arch=('i686' 'x86_64')
url='https://github.com/01org/libva-utils/'
license=('custom')
depends=('libva')
makedepends=('git' 'meson' 'mesa')
provides=('libva-utils')
conflicts=('libva-utils')
source=("$pkgname"::'git+https://github.com/intel/libva-utils.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    arch-meson . build
    ninja -C build
}

package() {
    cd "$pkgname"
    
    DESTDIR="$pkgdir" ninja -C build install
    
    mv "${pkgdir}/usr/bin/h264enc" "${pkgdir}/usr/bin/h264enc-libva-utils"
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
