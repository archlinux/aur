# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=1.0.1
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orhun/kmon/archive/v${pkgver}.tar.gz")
sha512sums=('0bf1aa1d8b65b028ed2bd10ff75f182e6a302920efc3c7cc3cf582b458466a406a5abea876bb62cc8454b590a253a344f0dc48d2aca069073c7ee993b2f7c249')

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