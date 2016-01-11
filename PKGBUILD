# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=tldr-rs-git
_name=tldr-rs
pkgver=r36.534fe17
pkgrel=1
pkgdesc="A fast TLDR client written in Rust."
arch=('any')
url="https://github.com/dbrgn/tldr-rs"
license=('MIT', 'Apache')
depends=('')
makedepends=('rust' 'cargo')
provides=('tldr')
conflicts=('tldr-rs', 'nodejs-tldr', 'nodejs-tldr-git', 'tldr-cpp-client', 'tldr-git')
options=(!emptydirs)
source=('git+https://github.com/dbrgn/tldr-rs')
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
