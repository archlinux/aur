# Maintainer ringo <ringo@deqc.xyz>

pkgname=reddix
pkgver=0.2.9
pkgrel=1
pkgdesc="Reddit, refined for the terminal."
arch=("x86_64")
url="https://github.com/ck-zhang/reddix"
license=("MIT")
makedepends=("cargo")
options=(!lto)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('6f943193bf65c9807859e401926c9026a0a2ec4a81215298930f84c62e250738f45003401eab33c55c0f5c6c4045a93e4edd34a34e204a86d731f44fd3dac558')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --locked --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
