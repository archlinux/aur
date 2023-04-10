# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=castor
pkgver=0.9.0
pkgrel=3
pkgdesc="A Gemini, Gopher and Finger protocol client"
arch=('i686' 'x86_64')
url="https://git.sr.ht/~julienxx/castor"
license=('MIT')
depends=('atk' 'cairo' 'gdk-pixbuf2' 'glibc' 'gtk3' 'openssl' 'pango')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~julienxx/castor/archive/$pkgver.tar.gz")
sha256sums=('ed57c92a88e8ebe8db286daad9677ffb99287d164d3193d17f8134bb77de5ae1')


prepare() {
  cd "$pkgname-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "$pkgname-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" copy-data
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/castor"
}
