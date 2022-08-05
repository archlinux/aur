# Maintainer: Abhishek "Abh15h3k" Banerji <abhishekbanerji1999@gmail.com>
# Contributor: Daniel "dtubber" Wanner <daniel.wanner@tubber.xyz>

pkgname="ryzenadj-git"
pkgver=0.11.0.r0.gf937c16
pkgrel=1
pkgdesc="RyzenAdj tool for adjusting Ryzen Mobile power states"
url="https://github.com/FlyGoat/RyzenAdj"
arch=("x86_64")
depends=("pciutils")
makedepends=("git" "cmake")
optdepends=("ryzen_smu-dkms-git: (AUR) kernel module needed to access pm_table on systems with strict memory access policy")
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
    mkdir build -p && cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dsm 755 build/ryzenadj $pkgdir/usr/bin/ryzenadj
    install -Dsm 744 build/libryzenadj.so $pkgdir/usr/lib/libryzenadj.so
    install -Dm 744 lib/ryzenadj.h $pkgdir/usr/include/ryzenadj.h
}
