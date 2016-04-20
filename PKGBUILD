# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fzy-git
pkgver=r170.80361f2
pkgrel=1
pkgdesc="A fuzzy text selector menu for the terminal"
arch=('i686' 'x86_64')
url="https://github.com/jhawthorn/fzy"
license=('custom:MIT')
depends=('glibc')
makedepends=('git')
provides=('fzy')
conflicts=('fzy')
source=("git+https://github.com/jhawthorn/fzy.git")
md5sums=('SKIP')
_gitname="fzy"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir"/"$_gitname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
