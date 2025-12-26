
# Maintainer: eldritch <your@email.com>
pkgname=infodash
desc="Modern GTK4 dashboard for RSS, weather, and stocks"
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/codingncaffeine/InfoDash"
license=('MIT')
depends=('gtk4' 'json-glib' 'libxml2' 'curl' 'gcc-libs' 'glibc' 'libcurl.so' 'libjson-glib-1.0.so')
makedepends=('cmake' 'git' 'gcc' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/codingncaffeine/InfoDash/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/InfoDash-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel
}

package() {
  cd "$srcdir/InfoDash-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  # Install .desktop file if present
  if [[ -f resources/infodash.desktop ]]; then
    install -Dm644 resources/infodash.desktop "$pkgdir/usr/share/applications/infodash.desktop"
  fi
  # Install icon if present
  if [[ -f resources/infodash.png ]]; then
    install -Dm644 resources/infodash.png "$pkgdir/usr/share/pixmaps/infodash.png"
  fi
}
