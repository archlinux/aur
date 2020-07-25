# Maintainer: Senya <senya at riseup.net>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=libjamiclient-git
pkgver=1.0.0.r787.gc51772f9
pkgrel=1
pkgdesc="Free and universal communication platform which preserves the users’ privacy and freedoms (client communication library)"
arch=(x86_64)
url="https://jami.net"
license=(GPL3)
groups=(jami)
depends=(jami-daemon-git qt5-base)
makedepends=(git cmake qt5-tools jami-daemon-git)
provides=(libringclient)
conflicts=(libringclient libjamiclient)
replaces=(libringclient)
source=("git+https://git.jami.net/savoirfairelinux/ring-lrc.git")
md5sums=(SKIP)

pkgver() {
  cd ring-lrc
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ring-lrc \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
