# Maintainer: alcubierre-drive

pkgname=btrfs-snap-cpp-git
pkgver=0.1.r31.g8f77c7a
pkgrel=1
pkgdesc="Creates and transfers btrfs snapshots"
license=('GPL3')
depends=('btrfs-progs' 'boost' 'systemd' 'polkit' 'dbus')
arch=('any')
url="https://github.com/alcubierre-drive/btrfs-snap"
makedepends=('git' 'cmake')
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
    local cmake_options=(
        -B build
        -S $pkgname
        -W no-author
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    : Nothing
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

