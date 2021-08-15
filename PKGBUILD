# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit
pkgver=3.0.2
pkgrel=1
depends=('elfutils' 'patchelf')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="automate starting binary exploit challenges"
license=('MIT')
url="https://github.com/io12/pwninit"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/io12/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2993e847d67ddfd0ae2b3b511b22d4e6c2389b0fa62c7a293e693e32d94f793b')

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
