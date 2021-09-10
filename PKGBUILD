# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=castor
pkgver=0.8.18
pkgrel=1
pkgdesc="A Gemini, Gopher and Finger protocol client"
arch=('i686' 'x86_64')
url="https://git.sr.ht/~julienxx/castor"
license=('MIT')
depends=('atk' 'cairo' 'gdk-pixbuf2' 'glibc' 'gtk3' 'openssl' 'pango')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~julienxx/castor/archive/$pkgver.tar.gz")
sha256sums=('02ea3d8c6a3b705ca54e489cb67bf5149261222c352696afe374843ff3bc06bb')


check() {
  cd "$pkgname-$pkgver"

  cargo test \
    --release \
    --locked
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
