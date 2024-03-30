# Maintainer  : Willy Micieli <micieli at vivaldi.net>
# Contributor : Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=15.0.0
pkgrel=1
pkgdesc="A program to check your code quality before all commit" 
provides=('zuu')
arch=('any')
url="https://github.com/otechdo/zuu"
license=('GPL')
makedepends=('cargo')
depends=('rustup' 'cargo-audit')
optdepends=('git: git support' 'mercurial: mercurial support')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('9ad13a6d2784845f1b6eba5f8ee6525ddd5f33735af25a9f58ce7e6b501cc7e8')

check(){
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  if [ -f "docker-compose.yml" ]
  then
    rm docker-compose.yml
  fi
  cargo run
}
build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release 
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  #install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
