# Maintainer: robertfoster

pkgname=mtd-utils-git
pkgver=1481.4594fc1
pkgrel=1
pkgdesc="MTD userspace tools"
arch=('i686' 'x86_64')
url="http://www.linux-mtd.infradead.org/index.html"
license=('GPL-2.0-only')
depends=(
  lzo
  util-linux
  zlib
  zstd
)
makedepends=(cmocka git)
provides=("${pkgname%-git}")
replaces=(mtd-tools-git "${pkgname%-git}")
conflicts=(mtd-tools-git)
source=("${pkgname%-git}::git://git.infradead.org/mtd-utils.git")

prepare() {
  cd "${pkgname%-git}"
  autoreconf -fiv
}

build() {
  cd "${pkgname%-git}"
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sbindir=/usr/bin \
    --enable-unit-tests \
    --enable-tests
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}

pkgver() {
  cd mtd-utils
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

sha256sums=('SKIP')
