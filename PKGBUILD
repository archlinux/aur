# Maintainer: averne <averne381@gmail.com>
pkgname=fuse-nx-git
pkgver=v1.1.r12.gd2c2f14
pkgrel=1
pkgdesc="Mount Nintendo Switch archives through FUSE"
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
url="https://github.com/averne/Fuse-Nx"
license=("GPL3")
makedepends=("git" "meson" "libgcrypt" "fuse")
provides=("fuse-nx")
source=("git+https://github.com/averne/Fuse-Nx.git")
md5sums=("SKIP")

pkgver() {
    cd $srcdir/Fuse-Nx
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir/Fuse-Nx
    meson --prefix=/usr --buildtype=release build
}

build() {
    cd $srcdir/Fuse-Nx
    meson compile -C build
}

package() {
    cd $srcdir/Fuse-Nx
    DESTDIR="$pkgdir" meson install -C build
}
