# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=ipsort
pkgver=1.3.1
pkgrel=1
pkgdesc="versitile ip address sorting tool"
arch=(x86_64)
url=https://github.com/mfinelli/ipsort
license=(GPL-3.0-or-later)
makedepends=(cargo scdoc)
depends=(glibc libgcc)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8b1b702bbf0f26de2c9cc56d77f9ba9b3e9a59b01a19e4070e366da73e377464')

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
