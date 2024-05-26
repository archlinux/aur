# Maintainer: Veroni zoubheir@gmail.com

pkgname="dnrs"
pkgver="1.1.2"
pkgrel=1
pkgdesc="Light dns server written in rust"
arch=('x86_64')
url="https://github.com/VeroniDeev/dnrs"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/VeroniDeev/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=dnrs.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -d "$pkgdir/etc/dnrs/dns"

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/etc/dnrs/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 dnrs.service "$pkgdir/usr/lib/systemd/system/dnrs.service"
}

post_install() {
  echo "Don't forget to configure your DNS server by modifying the files in /etc/dnrs/dns"
}
