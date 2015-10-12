# Maintainer: Ferdinand Bachmann <theferdi265@gmail.com>
pkgname=lemonbar-xft-dynstack-git
_pkgname=bar
pkgver=218.93294f4
pkgrel=1
pkgdesc="A lightweight xcb based bar with ported xft support and dynamic area stack size."
arch=('i686' 'x86_64')
url="https://github.com/Ferdi265/bar"
license=('MIT')
depends=('libxcb' 'libxft' 'libx11')
makedepends=('git')
provides=('bar-aint-recursive' 'lemonbar' 'lemonbar-xft-git')
conflicts=('bar-aint-recursive' 'lemonbar' 'lemonbar-xft-git')
source=("$_pkgname::git+https://github.com/Ferdi265/bar.git#branch=xft-port")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count makepkg).$(git rev-parse --short makepkg)
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
