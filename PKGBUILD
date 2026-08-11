# Maintainer: Gabriel <horizzon3507>
pkgname=optionmusic
pkgver=0.2.11
pkgrel=1
pkgdesc='Minimal black and white CLI music player powered by MPV'
arch=('x86_64')
url='https://github.com/fireflylabss/optionMusic'
license=('Apache-2.0')
depends=('mpv' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('cava: optional spectrum bars')
provides=('optmusic')
conflicts=('optmusic')
replaces=('optmusic')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e2218022b94625199f3e88a4aeb068d491d4c806535250262eb1451fffbadfbf')

prepare() {
  cd "optionMusic-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "optionMusic-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "optionMusic-$pkgver"
  install -Dm755 target/release/optionmusic "$pkgdir/usr/bin/optionmusic"
  install -Dm755 target/release/optmusic    "$pkgdir/usr/bin/optmusic"
  install -Dm755 target/release/msc         "$pkgdir/usr/bin/msc"
  install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md               "$pkgdir/usr/share/doc/$pkgname/README.md"
}
