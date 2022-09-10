# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: issue <issue at archlinux dot info>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=rust-racer-git
_pkgname=racer
pkgver=2.2.1.r4.ga457c23
pkgrel=1
pkgdesc="Code completion for Rust"
url="https://github.com/racer-rust/racer"
depends=('gcc-libs')
makedepends=('rustup' 'git')
provides=('rust-racer')
conflicts=('rust-racer')
arch=('i686' 'x86_64')
license=('MIT')
md5sums=('SKIP')
install=$pkgname.install
source=("git+https://github.com/racer-rust/$_pkgname.git")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/racer "$pkgdir/usr/bin/racer"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
