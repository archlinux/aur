pkgname=liveserver
pkgver=0.1.4
pkgrel=1
pkgdesc='Extremely small Linux-only static dev server with live reload'
arch=('x86_64')
url='https://git.imtheo.lol/theo/liveserver'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ce7c43d49c97a149fa96a3ee97fd5c4422430a14df2690526b2b08fb7fa52fd')

build() {
  cmake -S "$srcdir/liveserver" -B "$srcdir/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"

  install -Dm644 "$srcdir/liveserver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/liveserver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
