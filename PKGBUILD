# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>

pkgname=nymphrpc-git
pkgver=0.1.r7.g6e25d3a
pkgrel=1
pkgdesc="Versatile and fast remote procedure call library."
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/MayaPosch/NymphRPC"
license=(BSD)
depends=(poco)
makedepends=(git)
provides=(nymphrpc)
conflicts=(nymphrpc)
source=("git+https://github.com/MayaPosch/NymphRPC.git")
sha256sums=('SKIP')

pkgver() {
  cd NymphRPC
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd NymphRPC
  make lib
}

package() {
  cd NymphRPC
  make DESTDIR="${pkgdir}" install
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
