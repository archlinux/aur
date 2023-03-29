# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>
# Maintainer: Aloso <ludwig.stecher@gmx.de>

pkgname=to-html
pkgver=0.1.4
pkgrel=1
pkgdesc='Render a terminal with ANSI colors as HTML'
arch=(x86_64)
url="https://github.com/Aloso/$pkgname"
license=(MIT)
depends=(util-linux)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2d4a18cce32f22318dff7b7fdf82ea2267a1cd1c23b9d8c59213df3e188a71fa263db43c6b2bf1c78eed6164ac86cda80db4648e37858cfc2916cbc0b7868294')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
