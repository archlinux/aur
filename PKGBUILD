# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=testdisk-git
pkgver=7.2.r64.g0aa4bc2b
pkgrel=2
pkgdesc="Checks and undeletes partitions + PhotoRec, signature based recovery tool"
arch=(x86_64 aarch64)
url="https://www.cgsecurity.org/index.html?testdisk.html"
license=(GPL-2.0-or-later)
depends=(
    e2fsprogs
    glibc
    #hicolor-icon-theme
    libgcc
    libjpeg-turbo
    libntfs-3g
    libstdc++
    ncurses
    #qt6-base
    zlib
    )
makedepends=(
    git
    qt6-base
    qt6-tools
    )
optdepends=(
    'qt6-base: qphotorec'
    )
provides=(testdisk)
conflicts=(testdisk)
source=("git+https://git.cgsecurity.org/testdisk.git")
sha256sums=('SKIP')

pkgver() {
  cd "testdisk"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "testdisk"
  #./autogen.sh --force
  autoreconf -fi
}

build() {
  cd "testdisk"

  ./configure \
    --prefix=/usr \
    --enable-sudo

  make
}

package() {
  cd "testdisk"
  make DESTDIR="$pkgdir" install
}

