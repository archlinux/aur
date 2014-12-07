# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=dex-git
pkgver=62.2d158ca
pkgrel=1
pkgdesc="A program to execute DesktopEntry files of type Application, primarily for window managers that do not implement the Freedesktop autostart specification"
url="https://github.com/jceb/dex"
arch=('any')
license=('GPL2')
depends=('python')
makedepends=('git' 'python-sphinx')
provides=('dex')
conflicts=('dex')
source=('git+https://github.com/jceb/dex.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dex"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/dex"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/dex"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
