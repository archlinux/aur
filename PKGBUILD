# Maintainer: Damian Poddebniak <poddebniak at fh-muenster dot de>
pkgname=xim-git
pkgver=r44.4afc7ff
pkgrel=1
pkgdesc="Vim-like hex editor."
arch=('x86_64' 'i686' )
url="https://github.com/FHMS-ITS/Xim"
license=('AGPLv3')
makedepends=('git' 'rust' 'cargo')
provides=('xim')
source=('git+https://github.com/FHMS-ITS/Xim')
md5sums=('SKIP')

build() {
  cd "$srcdir/Xim"
  cargo build --release --locked --all-features
}

check() {
  cd "$srcdir/Xim"
  cargo test --release --locked
}

package() {
  cd "$srcdir/Xim"
  install -Dm 755 target/release/xim -t "${pkgdir}/usr/bin"
}

pkgver() {
  cd "$srcdir/Xim"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
