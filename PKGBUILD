# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: issue <issue at archlinux dot info>

pkgname=rust-racer-git
_pkgname=racer
pkgver=1.0.0.r138.gb9750c3
pkgrel=1
pkgdesc="Code completion for Rust"
url="https://github.com/phildawes/racer"
depends=('rust')
optdepends=('rust-src')
makedepends=('git' 'cargo')
provides=('rust-racer')
conflicts=('rust-racer')
replaces=('racer-git')
arch=('i686' 'x86_64')
license=('MIT')
md5sums=('SKIP')
install=$pkgname.install
source=("git+https://github.com/phildawes/$_pkgname.git")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/racer "$pkgdir/usr/bin/racer"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
