# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Sandy Carter <bwrsandman+aur@gmail.com>

pkgname=fuzzylite
pkgver=6.0
pkgrel=3
pkgdesc='C++ fuzzy logic control library'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/fuzzylite/fuzzylite'
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake')
provides=('libfuzzylite.so=6.0-64')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7e9f56deb9baf063de2232bfd8285f57ddccb651dae842fe3f587d0ac65ecdb0')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver/$pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DFL_BUILD_STATIC=OFF \
    -DFL_BUILD_TESTS=OFF \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="$pkgdir" -C build install
  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" 'README.md'
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$pkgname/$pkgname.1"
}

# vim: ts=2 sw=2 et:
