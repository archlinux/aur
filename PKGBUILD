# Maintainer: James Pike <github@chilon.net>
pkgname=fzu-git
pkgver=r393.27d9655
pkgrel=1
pkgdesc="A fuzzy text selector menu for the terminal"
arch=('i686' 'x86_64')
url="https://github.com/ohjames/fzu"
license=('custom:MIT')
depends=('glibc' 'libconfig' 'libxdg-basedir')
makedepends=('git')
provides=('fzu')
conflicts=('fzu')
source=("git+https://github.com/ohjames/fzu.git")
md5sums=('SKIP')
_gitname="fzu"

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
