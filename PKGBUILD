# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=testdisk-git
pkgver=7.1.r1029.g305d71ea
pkgrel=2
pkgdesc="Checks and undeletes partitions + PhotoRec, signature based recovery tool"
arch=(x86_64)
url="https://www.cgsecurity.org/index.html?testdisk.html"
license=(GPL)
depends=(libjpeg openssl ntfs-3g)
makedepends=(git qt5-base qt5-tools)
optdepends=('qt5-base: qphotorec')
provides=(testdisk)
conflicts=(testdisk)
source=("git+https://git.cgsecurity.org/testdisk.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  ./configure \
    --prefix=/usr \
    --enable-sudo

  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

