# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=serie
pkgver=0.1.0
_commit=779bd6ef1465c058de590e71d6dcab91b59e93b8
pkgrel=1
pkgdesc="A rich git commit graph in your terminal"
url="https://github.com/lusingander/serie"
depends=('gcc-libs')
makedepends=('cargo' 'git')
arch=('x86_64')
license=('MIT')
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
sha512sums=('cb9b740c3393b8185fbbb5c1e4b6bffcebcd8a6d7b9bfbade92817967c9bd26716a90a5382e62391d71f3d789bbc17b944112d6baa66cc5311ec0b60f397adc2')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
