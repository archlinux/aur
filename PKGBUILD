# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=v0.2.0
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
provides=("$pkgname")
conflicts=("$pkgname" "${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/orhun/kmon/archive/${pkgver}.tar.gz")
sha512sums=('f057dcdb5364252f280b3f1eac1902e952208c6027903da8dbfaf59fcac8ae07dc2d388718a4ae74dfa8360967e28583f868e5f5ae7171ad9982d8212327426d')

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
  install -Dm 644 kmon.man -t "$pkgdir/usr/local/man/man8/$pkgname.8"
  gzip "$pkgdir/usr/local/man/man8/$pkgname.8"
}