# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr
pkgver=0.5.13
pkgrel=1
pkgdesc="A hackable, minimal, fast TUI file explorer"
arch=('x86_64')
url="https://github.com/sayanarijit/xplr"
license=('MIT')
depends=('gcc-libs' 'hicolor-icon-theme')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e535bb152cecb646c9dd86c865f7b79a21e857c6f7da58d9c9a94b927e176c84b91ab5083288a7fd83776ca2c3a768149a734ab6c9afc098e0356469bc71fddf')

build() {
  cd "$pkgname-$pkgver"
  cargo build --locked --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 src/config.yml -t "$pkgdir/usr/share/$pkgname/examples"
  install -Dm 644 "assets/desktop/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  for i in 128 16 32 64; do
      install -Dm 644 "assets/icon/${pkgname}${i}.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
  install -Dm 644 "assets/icon/$pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
