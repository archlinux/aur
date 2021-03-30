# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# https://github.com/orhun/pkgbuilds

pkgname=prs
pkgver=0.2.7
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('x86_64')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'gtk3')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('0464d2434f8a9e9e335338cd90fba41e0927280dec2bb3c9dddbac2d58de9394a37f1835785d4e34b0668e0574162014f768be070af16786ae0adab875b78d1d')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-v$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
