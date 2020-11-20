# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=keepass-diff
_author=Narigo
_gitname=keepass-diff
pkgver=1.0.1
pkgrel=1
pkgdesc='Tool to find diff between KeePass (*.kdbx) files'
arch=(any)
url=https://github.com/Narigo/keepass-diff
license=(MIT)
makedepends=(
  cargo
)
source=("$_gitname-v$pkgver.tar.gz::https://github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('282d36e6b8becb3eeceb4705fdf0cecefc481ba736a5310ff315eb5fee8a0fc9')

build() {
  cd "$_gitname-$pkgver"
  export RUSTFLAGS="-C target-cpu=native"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$_gitname-$pkgver"
  cargo test --release --locked --all-features --target-dir=target
}

package() {
  cd "$_gitname-$pkgver"
  install -Dm755 "target/release/keepass-diff" "$pkgdir/usr/bin/keepass-diff"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
