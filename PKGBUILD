# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=0.3.2
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orhun/kmon/archive/v${pkgver}.tar.gz")
sha512sums=('ac80fb8f8bc8ecc70021796488421a0d0190aedf5179a2a2beba21cfe33729f52556b8b1db4404cbdbd267042977e07a55478e82b51ac6462289d8afdd456b8b')

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