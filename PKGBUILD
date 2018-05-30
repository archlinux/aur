pkgname=pacaur-git
pkgver=4.7.90
pkgrel=1
pkgdesc="An AUR helper that minimizes user interaction"
arch=('any')
url="https://github.com/rmarquis/pacaur"
license=('ISC')
depends=('cower' 'expac' 'sudo' 'git')
makedepends=('perl')
provides=('pacaur')
conflicts=('pacaur')
backup=('etc/xdg/pacaur/config')
source=("git://github.com/rmarquis/pacaur.git")
md5sums=('SKIP')
_gitname="pacaur"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd "$srcdir/$_gitname"
  _pkgver=$(git describe --always | sed 's/-/./g')
  sed -i "s/version=\"[0-9].[0-9].[0-9]*\"/version=\"$_pkgver\"/g" ./pacaur
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR=$pkgdir PREFIX=/usr
}
