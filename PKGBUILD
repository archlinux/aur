# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=waylend
pkgver=0.2.0
pkgrel=1
pkgdesc="A calm and simple logout menu"
arch=('x86_64')
url="https://sr.ht/~bitfehler/waylend"
license=('EUPL-1.2')
depends=('egl-wayland' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f5030d7f6c3c485ff886fac9890c12ad5f4a9fac8cbab284212b4a44d3a5c9dbb2f860be08d2ccf14c5bcc66ab1ec5cb284eba70e0a81c37aedb72e51cf032fe')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/waylend" "$pkgdir/usr/bin/waylend"
  install -Dm644 "config.scfg" "$pkgdir/etc/waylend.scfg"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "assets/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.icons"
}
