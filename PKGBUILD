# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ThePuzzlemaker <tpzker at thepuzzlemaker dot info>

pkgname=zmqpp-git
pkgver=4.2.0.r47.gba4230d
pkgrel=2
pkgdesc="High-level C++ binding for ZMQ"
arch=(x86_64)
url="https://zeromq.github.io/zmqpp/"
license=(MPL2)
depends=(glibc gcc-libs boost-libs zeromq)
makedepends=(git boost)
provides=(zmqpp)
conflicts=(zmqpp)
source=("git+https://github.com/zeromq/zmqpp.git#branch=develop"
        "https://github.com/zeromq/zmqpp/pull/238/commits/4c0f99a4afd5a88e5e894d84f3eef0e0fb17f58d.patch")
sha256sums=('SKIP'
            '11ccea23fe6482debb9083ccf4e724d87544b43401cacbc20b09a4f745855fc6')

pkgver() {
  cd zmqpp
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd zmqpp
  patch -Np1 -i ../4c0f99a4afd5a88e5e894d84f3eef0e0fb17f58d.patch
}

build() {
  cd zmqpp
  make
  make client
}

package() {
  cd zmqpp
  make PREFIX="/usr/" DESTDIR="${pkgdir}/" install
}
