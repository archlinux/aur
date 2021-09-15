# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cocogitto
pkgver=3.0.0
pkgrel=1
pkgdesc="Set of CLI tools for the conventional commit and semver specifications"
arch=('x86_64')
url="https://github.com/oknozor/cocogitto"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e5cad97823d0e8a08b4165a8ec1c62ebd673f5f977accc925794e93614bc8bb536feacaf2755b29c21cf570ce0b463265c575190b706427b7ec538c66ad009aa')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir completions/
  # TODO: use --locked in the next release
  cargo fetch #--locked
}

# TODO: enable shell completions in the next release
build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
  #for bin in 'cog' 'coco'; do
  #  "target/release/$bin" generate-completions bash > "completions/$bin.bash"
  #  "target/release/$bin" generate-completions fish > "completions/$bin.fish"
  #  "target/release/$bin" generate-completions zsh > "completions/_$bin"
  #done
}

#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --frozen
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/coco" -t "$pkgdir/usr/bin"
  install -Dm 755 "target/release/cog" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  #for bin in 'cog' 'coco'; do
  #  install -Dm 644 "completions/$bin.bash" "${pkgdir}/usr/share/bash-completion/completions/$bin"
  #  install -Dm 644 "completions/$bin.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  #  install -Dm 644 "completions/_$bin" -t "${pkgdir}/usr/share/zsh/site-functions"
  #done
}
