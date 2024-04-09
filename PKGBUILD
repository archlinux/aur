# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: carstene1ns - https://git.io/ctPKG

pkgname=gtkhash-git
pkgver=1.5.r35.ge85ab4d
pkgrel=1
pkgdesc="A cross-platform desktop utility for computing message digests or checksums"
arch=(x86_64 i686)
url="https://github.com/gtkhash/gtkhash"
license=(GPL2)
depends=(dconf nettle libb2 gtk3)
makedepends=(git)
conflicts=(gtkhash)
provides=(gtkhash)
source=("git+https://github.com/gtkhash/gtkhash.git")
sha256sums=('SKIP')

pkgver() {
  cd gtkhash
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gtkhash
  ./autogen.sh
}

build() {
  cd gtkhash
  ./configure \
    --prefix=/usr \
    --disable-schemas-compile \
    --enable-gtkhash \
    --enable-linux-crypto \
    --enable-nettle

  make
}

package() {
  make -C gtkhash DESTDIR="${pkgdir}" install
}
