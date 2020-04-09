# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=1.1.0
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orhun/kmon/archive/v${pkgver}.tar.gz")
sha512sums=('2b70337fd6e9e5afb5c23460a530b8c4d9c708d3268d148e6a9dd46c133fcfc5d8fff63403f43e8caaf2096d3b6678637a7a2bfb2b29d880270495d5c623c0ae')

build() {
  cd "$pkgname-${pkgver#v}"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-${pkgver#v}"
  cargo test --release --locked
}

package() {
  cd "$pkgname-${pkgver#v}"
  install -Dm 755 "target/release/$pkgname" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "man/$pkgname.8" -t "$pkgdir/usr/share/man/man8"
  gzip "$pkgdir/usr/share/man/man8/$pkgname.8"
}