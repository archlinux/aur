# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: issue <issue at archlinux dot info>

pkgname=racer-git
_pkgname=racer
pkgver=r545.465e4b8
pkgrel=1
pkgdesc="Code completion for Rust"
url="https://github.com/phildawes/racer"
depends=('rust')
makedepends=('git' 'cargo')
arch=('i686' 'x86_64')
license=('MIT')
md5sums=('SKIP')
install=$pkgname.install
source=('git+https://github.com/phildawes/racer.git')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$_pkgname/target/release/racer" "$pkgdir/usr/bin/racer"
  install -Dm644 "$srcdir/$_pkgname/editors/emacs/racer.el" "$pkgdir/usr/share/emacs/site-lisp/racer.el"
  install -Dm644 "$srcdir/$_pkgname/plugin/racer.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/racer.vim"
  install -Dm644 "$srcdir/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
