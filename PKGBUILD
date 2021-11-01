# Maintainer: alcubierre-drive

pkgname=btrfs-snap-cpp-git
pkgver=0.1.r0.g8cdbef2
pkgrel=1
pkgdesc="Creates and transfers btrfs snapshots"
license=('GPL3')
depends=('btrfs-progs')
arch=('any')
url="https://github.com/alcubierre-drive/btrfs-snap"
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=( 'SKIP' )

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

prepare() {
    : Nothing
}

build() {
    cd "${srcdir}/${pkgname}"
    mkdir build
    cd build
    cmake ..
    make
}

check() {
    : Nothing
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX="$pkgdir" make install
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/build/btrfs-snap" "${pkgdir}/usr/bin/btrfs-snap-cpp"
}
