# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonpaper
pkgver=0.1.4
pkgrel=3
pkgdesc="HUSH paper wallet generator"
url="https://git.hush.is/hush/SilentDragonPaper"
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('rust')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('512f687e46466a35a6bb83a571f8c88f535359fd644ceefe972326721c714df1a05fefc88127998d0d0644de60ee2a772bb558ee22b76f5193f2a56dea58ad75')

build() {
  tar xzvf $pkgname-$pkgver-$pkgrel.tar.gz
  cd ${pkgname}/cli
  cargo vendor
  cargo build --release --offline
}

package() {
  install -Dm755 "${srcdir}/$pkgname/cli/target/release/SilentDragonPaper" "${pkgdir}/opt/$pkgname/$pkgname"
  install -Dm644 "${srcdir}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/$pkgname/README.md" "${pkgdir}/opt/$pkgname/README.md"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/silentdragonpaper "${pkgdir}/usr/bin"
}
