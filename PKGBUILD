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
sha256sums=('5840d0b875caf519a9f8f2287a1e84b563830f3d79e78f285300b0d87f6ef2d1')

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
