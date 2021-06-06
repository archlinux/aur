# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit
pkgver=3.0.0
pkgrel=1
depends=('elfutils' 'patchelf')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="automate starting binary exploit challenges"
license=('MIT')
url="https://github.com/io12/pwninit"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/io12/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f79a7b94c42970b0d3303a1684079b427ea94a5705853fa190a45758a33ab8ab')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
