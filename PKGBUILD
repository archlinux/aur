# Maintainer: <grawity@gmail.com>
# Contributor: goll <adrian.goll+aur[at]gmail>

pkgname=lib32-nocache
pkgver=1.0
pkgrel=1
pkgdesc="minimize caching effects"
arch=(x86_64)
url="https://github.com/Feh/nocache"
license=('FreeBSD License')
depends=(lib32-glibc nocache)
makedepends=(gcc-multilib)
source=("git+https://github.com/Feh/nocache.git#tag=v1.0")
sha256sums=('SKIP')

pkgver() {
  cd "nocache"
  git describe | sed "s/^v//; s/-/.r/; s/-/./"
}

build() {
  cd "nocache"
  make CC="gcc -m32"
}

package() {
  cd "nocache"
  make PREFIX=/usr LIBDIR=/lib32 DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{bin,share}
}

# vim: ts=2:sw=2:et:
