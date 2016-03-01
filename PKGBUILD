# Maintainer: Alexandre B. <alexandre.bury@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=rusti-git
_pkgname=rusti
pkgver=r164.9d77720
pkgrel=1
pkgdesc="REPL for Rust"
url="https://github.com/murarth/rusti"
depends=('readline' 'rust')
makedepends=('git' 'cargo')
optdepends=('rust-racer: for code completion')
provides=('rusti')
conflicts=('rusti')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
source=("git+https://github.com/murarth/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  install -D -m755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -D -m644 "$srcdir/$_pkgname/"{LICENSE-APACHE,LICENSE-MIT} "$pkgdir/usr/share/licenses/$pkgname/"
}

