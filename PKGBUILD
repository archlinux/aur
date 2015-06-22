# $Id: PKGBUILD 124506 2014-12-24 11:01:16Z flexiondotorg $
# Original Package: Martin Wimpress <code@flexion.org>
# Maintainer: Lubosz Sarnecki <lubosz0@gmail.com>

pkgname=lib32-libxnvctrl
pkgver=343.36
pkgrel=1
pkgdesc="NVIDIA X Ctrl library"
arch=('x86_64')
url="http://www.nvidia.com/"
license=('GPL2')
makedepends=('libxext')
options=('staticlibs')
source=("ftp://download.nvidia.com/XFree86/nvidia-settings/nvidia-settings-${pkgver}.tar.bz2")
sha256sums=('c0429f79354bf6aaeda49d0a6a3a830f073b185b21b4a8223f1e5781c788d275')

build() {
    cd "nvidia-settings-${pkgver}/src/libXNVCtrl"
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'    
    make clean
    make
}

package() {
    cd "nvidia-settings-${pkgver}/src/libXNVCtrl"
    # install libXNVCtrl and headers
    install -d -m 755 "${pkgdir}"/usr/lib32
    install -m 644 libXNVCtrl.a "${pkgdir}"/usr/lib32/libXNVCtrl.a
}
