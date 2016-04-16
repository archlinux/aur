# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=tealdeer-git
_name=tealdeer
pkgver=r78.db423da
pkgrel=1
pkgdesc="A fast TLDR client written in Rust."
arch=('x86_64' 'i686')
url="https://github.com/dbrgn/tealdeer"
license=('MIT', 'Apache')
depends=('')
makedepends=('git' 'rust' 'cargo')
provides=('tldr')
conflicts=('tldr-rs', 'tldr-rs-git', 'nodejs-tldr', 'nodejs-tldr-git', 'tldr-cpp-client', 'tldr-git')
options=(!emptydirs)
source=('git+https://github.com/dbrgn/tealdeer')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_name"
  cargo build --release
}

package() {
  cd "$srcdir/$_name"
  mkdir -p $pkgdir/usr/bin
  install -o root -g root -m 755 target/release/tldr $pkgdir/usr/bin
}

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
