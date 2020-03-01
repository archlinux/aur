# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=v0.2.2
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
sha512sums=('ad1e4bae380b7b769b1b6082b76eaabd462b9e9f9feab28aa01f9477690b7d636b023ad8cae7ebdd2e588d587499d06ad8704f917aac72c4c683a8989d66605b')

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
  install -Dm 644 "man/$pkgname.8" -t "$pkgdir/usr/local/man/man8"
  gzip "$pkgdir/usr/local/man/man8/$pkgname.8"
}