# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit
pkgver=3.1.0
pkgrel=1
depends=('elfutils' 'patchelf')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="automate starting binary exploit challenges"
license=('MIT')
url="https://github.com/io12/pwninit"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/io12/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('19527aa5d9cf1290ff639e7917d8ec26ac388dab9dcd76f3d3aecf29621bce20')

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
