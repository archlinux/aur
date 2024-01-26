# Maintainer  : Willy Micieli <micieli at vivaldi.net>
# Contributor : Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=8.0.1
pkgrel=1
pkgdesc="A program to check your code quality before all commit" 
provides=('zuu' 'pre-commit')
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
makedepends=('cargo')
depends=('rustup' 'rsbadges' 'wget' 'ncurses' 'cargo-audit')
optdepends=('git: git support' 'mercurial: mercurial support' 'docker-compose: docker-compose support')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('3000e9e2b949e7e0023d6690a13939f258707facb731f86a3f4b37a361b4c81c')

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
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm0755 -t "$pkgdir/usr/bin/" "pre-commit"
}

# vim: ts=2 sw=2 et:
