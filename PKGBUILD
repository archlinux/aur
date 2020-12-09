# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli
_pkgname=sic
pkgver=0.14.0
pkgrel=3
pkgdesc="Accessible image processing and conversion from the terminal"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
conflicts=("$_pkgname")
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/shell_completions.zip")
sha512sums=('dffd61d089fa83b13cfbc0083a0528df68feb39a3f9c8d307289e0cfb6372a507c0c7789d0a1beba144424fff15445f7689d2c8ff7093a984244b9d1fd506aad'
            'c3ce7c681c50a4bba8f29cca4f3269b857bd7f5f64b7b84c411fb41d4ff0ace6c06aae760bdcc81be0a750f271bac2cf80f6fc8376d5f3e293d915e2b37d3ecc')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked --all-features
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
