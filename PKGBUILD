# Maintainer: Daniel "dtubber" Wanner <daniel.wanner@tubber.xyz>

pkgname="ryzenadj-git"
pkgver=v0.5.2.r2.g82afad3
pkgrel=1
pkgdesc="RyzenAdj tool for adjusting Ryzen Mobile power states"
url="https://github.com/FlyGoat/RyzenAdj"
arch=("x86_64")
depends=("pciutils")
makedepends=("cmake")
license=("LGPL2")
source=("$pkgname::git+https://github.com/FlyGoat/RyzenAdj")
md5sums=("SKIP")

pkgver() {
    cd $pkgname
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'    
}

build() {
    cd $pkgname
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib
    install -sm 755 $pkgname/build/ryzenadj $pkgdir/usr/bin
    install -sm 744 $pkgname/build/libryzenadj.so $pkgdir/usr/lib
}
