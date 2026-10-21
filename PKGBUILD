# Maintainer: Nomenclatura @ irc.libera.chat

pkgname=kg-git
pkgver=r165.449fac2
pkgrel=1
pkgdesc="A tiny, lightning-fast UTF-8 text editor with pure Emacs keybindings (fork of kilo, spiritual successor to mg)"
arch=('x86_64')
url="https://github.com/troglobit/kg"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git')
provides=('kg')
conflicts=('kg')
source=("git+https://github.com/troglobit/kg.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kg"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/kg"
  make
}

package() {
  cd "$srcdir/kg"
  make install prefix=/usr DESTDIR="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
