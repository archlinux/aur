# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: issue <issue at archlinux dot info>

pkgname=rust-racer
_pkgname=racer
pkgver=1.0.0
pkgrel=1
pkgdesc="Code completion for Rust"
url="https://github.com/phildawes/racer"
depends=('rust')
optdepends=('rust-src')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
install=$pkgname.install
source=("https://github.com/phildawes/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('78895296ed688eeccbaf7745235f0fc503407bfa718f53583a4dcc9e1246b7f5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 target/release/racer "$pkgdir/usr/bin/racer"
  install -Dm644 editors/emacs/racer.el "$pkgdir/usr/share/emacs/site-lisp/racer.el"
  install -Dm644 plugin/racer.vim "$pkgdir/usr/share/vim/vimfiles/plugin/racer.vim"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
