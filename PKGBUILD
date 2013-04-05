# Maintainer: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
_pkgname=tmux-applet
pkgname=$_pkgname-git
pkgver=20130309.g514d519
pkgrel=1
pkgdesc="Simple applet enhancement and configuration file for tmux"
arch=('i686' 'x86_64')
url="https://github.com/vianney/tmux-applet"
license=('GPL3')
depends=('tmux')
makedepends=('git')
backup=('etc/tmux-applet.conf')
install=install
source=("git://github.com/vianney/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "$_date.g$_hash"
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr ETCDIR=/etc
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr ETCDIR=/etc install
}

# vim:set ts=2 sw=2 et:
