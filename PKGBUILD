# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=fbarcalc
pkgver=1.0.2
pkgrel=1
pkgdesc="calculate the maximum account value"
arch=(x86_64)
url=https://github.com/mfinelli/fbarcalc
license=(GPL-3.0-or-later)
makedepends=(cargo)
depends=(glibc libgcc)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('e19ea6eb55cf86454cb7d8156d9b182e8668e39013e7df3fd0a88433efe75ca2')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
