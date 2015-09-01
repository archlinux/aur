# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: issue <issue at archlinux dot info>

pkgname=rust-racer-git
_pkgname=racer
pkgver=1.0.0.r117.gbf8ffa4
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
  install -Dm755 "$srcdir/$_pkgname/target/release/racer" "$pkgdir/usr/bin/racer"
  install -Dm644 "$srcdir/$_pkgname/plugin/racer.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/racer.vim"
  install -Dm644 "$srcdir/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
