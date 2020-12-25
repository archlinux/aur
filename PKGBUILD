# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli
_pkgname=sic
pkgver=0.15.0
pkgrel=1
pkgdesc="Accessible image processing and conversion from the terminal"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
conflicts=("$_pkgname")
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/shell_completions.zip")
sha512sums=('6509b227ea1585355275f2086c5b92f0452c12cca0680b09f0692903ce3135c00289578a76f3b12dd4e6e0c87c9c711ad706c5bfd07f29919d9fa9c35074b906'
            'c3ce7c681c50a4bba8f29cca4f3269b857bd7f5f64b7b84c411fb41d4ff0ace6c06aae760bdcc81be0a750f271bac2cf80f6fc8376d5f3e293d915e2b37d3ecc')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "../$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "../$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "../_$_pkgname" -t "${pkgdir}/usr/share/zsh/site-functions"
}
