# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jaryl Chng <mrciku@gmail.com>

pkgname=libewf-git
pkgver=20231119.r3.gf5aa2e2
pkgrel=1
pkgdesc="Library to access the Expert Witness Compression Format (EWF)"
arch=(x86_64)
url="https://github.com/libyal/libewf"
license=(LGPL)
depends=(bzip2 fuse2 openssl zlib glibc)
makedepends=(git)
provides=(libewf)
conflicts=(libewf)
source=("git+https://github.com/libyal/libewf.git")
sha256sums=('SKIP')

pkgver() {
  cd "libewf"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "libewf"
  ./synclibs.sh
  ./autogen.sh
}

build() {
  cd "libewf"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  make
}

package() {
  cd "libewf"
  make DESTDIR="$pkgdir/" install
}
