# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=castor
pkgver=0.8.16
pkgrel=1
pkgdesc="A Gemini, Gopher and Finger protocol client"
arch=('i686' 'x86_64')
url="https://git.sr.ht/~julienxx/castor"
license=('MIT')
depends=('atk' 'cairo' 'gdk-pixbuf2' 'glibc' 'gtk3' 'openssl' 'pango')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~julienxx/castor/archive/$pkgver.tar.gz")
sha256sums=('9a72ed66a10abd9d6fb44c02349f6c4035ff7d89397eb928c90f1465c3cccf7d')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/castor"
}
