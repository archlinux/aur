# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=v0.2.1
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
sha512sums=('3924b0d8ae7aaab2103fbc139f3b6c51456a0102a878fede0735db1a66afd6327d4e40191f07e16c7a58af7cc61642cb37919232c58700d30f7e1905d8084eb3')

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