# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>

pkgname=zsync2-git
pkgver=2.0.0.alpha.1.20230304.r7.g9337846
pkgrel=1
pkgdesc="A rewrite of the advanced file download/sync tool zsync"
arch=(x86_64)
url="https://github.com/AppImageCommunity/zsync2"
license=(PerlArtistic)
depends=(glibc gcc-libs cpr curl libgcrypt)
makedepends=(git cmake args gtest)
provides=(zsync2)
conflicts=(zsync2)
source=("git+https://github.com/AppImageCommunity/zsync2.git")
b2sums=('SKIP')

CFLAGS="$CFLAGS -Wno-incompatible-pointer-types"

pkgver() {
  cd zsync2
  git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "zsync2" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_CPR=ON \
    -DUSE_SYSTEM_ARGS=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D zsync2/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
