# Maintainer: Vomitblood <tohyouxuan@gmail.com>

pkgname=rustmon-git
pkgdesc="Pokemon Colorscripts written in Rust"
_gitname=rustmon
pkgver=r26.2b2a15c
pkgrel=1
arch=('x86_64')
url="https://github.com/Vomitblood/$_gitname"
license=('GPL')
depends=('glibc' 'gcc-libs')
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
  cd "$srcdir/$_gitname"
  # build main program
  cargo build --release
  # build mini program
  cargo build --release --bin minimon
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 target/release/$_gitname "$pkgdir/usr/bin/$_gitname"
  install -Dm755 target/release/minimon "$pkgdir/usr/bin/minimon"
}
