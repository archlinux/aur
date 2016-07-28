# Maintainer: PkmX <pkmx.tw@gmail.com>
pkgname=bug5-git
_pkgname=bug5
pkgver=1.18.r2.g3509bde
pkgrel=1
pkgdesc="A Big5/GBK <-> UTF-8 translating layer in terminal"
arch=('i686' 'x86_64')
url="https://github.com/buganini/bug5"
license=('BSD')
depends=('bsdconv')
makedepends=('git')
provides=('bug5')
conflicts=('bug5')
source=("$_pkgname::git+https://github.com/buganini/bug5")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
