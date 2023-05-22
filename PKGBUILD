# Maintainer: Jeremy M. Reed <reeje76@gmail.com>
pkgname=image-file-name-fixer
pkgver=0.0.2
pkgrel=1
pkgdesc="A tool to enforce a consistent naming scheme for image files."
arch=('x86_64')
url="https://github.com/jeremymreed/image-file-name-fixer"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeremymreed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b839d3a7864369240782d589f155835ce8aec05ff7ece0432cbae799774b3dec86280540486a88dc65bade823a094fbb97765b1e03d8d381442689969b51e01c')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}

