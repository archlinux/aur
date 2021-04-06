# Maintainer: Abhishek "Abh15h3k" Banerji <abhishekbanerji1999@gmail.com>
# Contributor: Daniel "dtubber" Wanner <daniel.wanner@tubber.xyz>

pkgname="ryzenadj-git"
pkgver=0.5.2.r2.g82afad3
pkgrel=3
pkgdesc="RyzenAdj tool for adjusting Ryzen Mobile power states"
url="https://github.com/FlyGoat/RyzenAdj"
arch=("x86_64")
depends=("pciutils")
makedepends=("git" "cmake")
license=("LGPL3")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/FlyGoat/RyzenAdj")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    mkdir build && cd build
    cmake ..
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dsm 755 build/ryzenadj $pkgdir/usr/bin/ryzenadj
    install -Dsm 744 build/libryzenadj.so $pkgdir/usr/lib/libryzenadj.so
}
