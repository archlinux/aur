# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=sdl2trs
_pkgname=sdltrs
pkgver=1.2.35
_commit=96d531a4ced487b75448597944d0d3a3c9972f82
pkgrel=1
arch=('x86_64')
pkgdesc="TRS-80 Model I/III/4/4P emulator (with hardware rendering)"
url="https://gitlab.com/jengun/sdltrs"
license=('BSD-2-Clause')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake' 'git')
#source=("$url/-/archive/$_commit/$_pkgname-$_commit.tar.gz")
source=("git+${url}.git#commit=${_commit}")
b2sums=('SKIP')

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

build() {
  cmake $_pkgname \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build/
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
