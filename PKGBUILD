# Maintainer: Gabriel <horizzon3507>
pkgname=optmusic
pkgver=0.2.5
pkgrel=1
pkgdesc='Minimal black and white CLI music player powered by MPV'
arch=('x86_64')
url='https://github.com/fireflylabss/optMusic'
license=('Apache-2.0')
depends=('mpv' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('cava: optional spectrum bars')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77aad366df76b37c337c06034d1089b475c58c4073472a35d0cfc8a627076498')

prepare() {
  cd "optMusic-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "optMusic-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "optMusic-$pkgver"
  install -Dm755 target/release/optmusic "$pkgdir/usr/bin/optmusic"
  install -Dm755 target/release/msc      "$pkgdir/usr/bin/msc"
  install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md               "$pkgdir/usr/share/doc/$pkgname/README.md"
}
