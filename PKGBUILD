# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
#
pkgname=nmail-git
_pkgname=nmail
pkgrel=1
pkgver=r584.05c7a04
pkgdesc="Terminal-based email client, git version"
arch=(x86_64)
url="https://github.com/d99kris/$_pkgname"
license=(MIT)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(
  'cyrus-sasl'
  'libetpan.so'
  'libmagic.so'
  'libncursesw.so'
  'libsqlite3.so'
  'libxapian.so'
  'openssl'
  'python')
makedepends=(cmake git)
source=(git+https://github.com/d99kris/nmail.git)
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake \
    -S "$_pkgname" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname"/LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
