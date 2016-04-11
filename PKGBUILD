# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: sekret <sekret at posteo.se>

pkgname=libsodium-git
pkgver=1.0.10.r10.g0a590b0
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (git version)"
arch=('i686' 'x86_64' 'armv7l' 'armv7h')
url="https://github.com/jedisct1/libsodium"
license=('ISC')
makedepends=('git')
conflicts=('libsodium')
provides=('libsodium')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  sh autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set sts=2 sw=2 et:
