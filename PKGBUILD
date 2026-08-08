# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=minhtml
pkgver=0.18.1
pkgrel=1
pkgdesc="Extremely fast and smart HTML + JS + CSS minifier"
arch=('x86_64')
url="https://github.com/wilsonzlin/minify-html"
license=(MIT)
depends=(glibc libgcc)
makedepends=(cargo git)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('3c49722d797e8ffda4ee05a2a0ed31bb83f519e5cd1e5fd7d2a36dea65264cda')

prepare() {
  cd "minify-html-$pkgver/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build() {
  cd "minify-html-$pkgver/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "minify-html-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname/target/release/$pkgname"
  install -Dm 644 "$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
