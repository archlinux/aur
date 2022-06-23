# Maintainer: PinkD <443657547@qq.com>

pkgname=corplink-rs
_pkgbase=corplink-rs
pkgver=1.2
pkgrel=1
pkgdesc='Corplink client written in Rust'
arch=('i686' 'x86_64')
url='https://github.com/PinkD/corplink-rs'
license=('GPL2')
makedepends=('cargo')
source=("$pkgname.tar.gz"::"https://github.com/PinkD/corplink-rs/archive/$pkgver.tar.gz")
sha256sums=('7ccd5223988f6ff4075d9ed71dc31402f2b833438c7c8e1a66b375fe38a5a41c')
backup=(etc/corplink/config.json)

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 600 "config/config.json" "$pkgdir/etc/corplink/config.json"
  install -Dm 644 "systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm 644 "systemd/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
}
