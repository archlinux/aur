# Maintainer: Stephen Smith <stephen304@gmail.com>
pkgname=lemonbar-clicks-git
_pkgname=bar
pkgver=1.3.22
pkgrel=1
pkgdesc="A lightweight xcb based bar with ported xft support, support to specify outputs, support for unlimited clickable areas and support for longer input."
arch=('i686' 'x86_64')
url="https://github.com/ph111p/bar"
license=('MIT')
depends=('libxcb' 'libxft' 'libx11')
makedepends=('git')
provides=('bar-aint-recursive' 'lemonbar')
conflicts=('bar-aint-recursive' 'lemonbar')
source=("$_pkgname::git+https://github.com/ph111p/bar.git#branch=xft-port")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git describe --abbrev=0 --tags).$(git rev-list --count $(git describe --abbrev=0 --tags)..HEAD)
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
