# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Boohbah <boohbah at gmail.com>
# Contributor: sekret <sekret at posteo.se>

pkgname=libsodium-git
pkgver=1.0.18.r291.g33b93592
pkgrel=1
pkgdesc="A modern, portable, easy to use crypto library"
arch=('i686' 'x86_64')
url="https://libsodium.org/"
license=('custom:ISC')
depends=('glibc')
makedepends=('git')
provides=('libsodium')
conflicts=('libsodium')
options=('staticlibs')
source=("git+https://github.com/jedisct1/libsodium.git")
sha256sums=('SKIP')


pkgver() {
  cd "libsodium"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libsodium"

  ./autogen.sh -s
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libsodium"

  make check
}

package() {
  cd "libsodium"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libsodium"
}
