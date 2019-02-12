# Maintainer: Daniel "dtubber" Wanner <daniel.wanner@tubber.xyz>

pkgname="ryzenadj-git"
pkgver=v0.2.r3.g68bf3a1
pkgrel=3
pkgdesc="RyzenAdj tool for adjusting Ryzen Mobile power states"
url="https://github.com/FlyGoat/RyzenAdj"
arch=("x86_64")
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
    make -j
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $pkgname/build/ryzenadj $pkgdir/usr/bin/
    chmod +x $pkgdir/usr/bin/ryzenadj
}