# Maintainer: Vomitblood <tohyouxuan@gmail.com>

pkgname=rustmon-git
pkgdesc="Pokemon Colorscripts written in Rust"
_gitname=rustmon
pkgver=r47.31f64ae
pkgrel=1
arch=('x86_64')
url="https://github.com/Vomitblood/$_gitname"
license=('GPL')
depends=('glibc' 'gcc-libs' 'base-devel')
makedepends=('git' 'cargo')
provides=("$_gitname")
source=("git+$url.git")
md5sums=('SKIP')
options=(!debug)
PKGEXT='.pkg.tar'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # fix linking errors
  export CFLAGS="-fPIE"
  cd "$srcdir/$_gitname"
  # build main program
  cargo build --release --bin rustmon
  # build mini program
  cargo build --release --bin minimon
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 target/release/rustmon "$pkgdir/usr/bin/rustmon"
  install -Dm755 target/release/minimon "$pkgdir/usr/bin/minimon"
}
