# Maintainer: alcubierre-drive

pkgname=btrfs-snap-cpp-git
pkgver=0.1.r13.gb23a1e0
pkgrel=1
pkgdesc="Creates and transfers btrfs snapshots"
license=('GPL3')
depends=('btrfs-progs' 'boost')
arch=('any')
url="https://github.com/alcubierre-drive/btrfs-snap"
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=( 'SKIP' )
backup=( "etc/btrfs-snap-cpp.conf" )

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
    cmake .. -DDEFAULT_CONFIG_FILE=/etc/btrfs-snap-cpp.conf
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
    install -Dm644 "${srcdir}/${pkgname}/btrfs-snap.conf" "${pkgdir}/etc/btrfs-snap-cpp.conf"
}
