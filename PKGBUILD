# Maintainer: Gabriel <horizzon3507>
pkgname=opt
pkgver=0.1.0
pkgrel=1
pkgdesc='Option family CLI: dispatch, doctor, install and system utilities'
arch=('x86_64')
url='https://github.com/fireflylabss/optioncli'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("optioncli-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('63612d1d1fe38635fbd513af80cedeb9679ac310718263ee8d6d122e2f52d746')

prepare() {
  cd "optioncli-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "optioncli-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "optioncli-$pkgver"
  install -Dm755 target/release/opt "$pkgdir/usr/bin/opt"
  install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md                  "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md               "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
