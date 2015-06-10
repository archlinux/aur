# Maintainer: Buce <dmbuce@gmail.com>

pkgname=virtle-git
pkgver=0.r7.g7cd2603
pkgver() {
  cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=1
pkgdesc="libvirt wrapped in a shell."
arch=(any)
url="https://github.com/DMBuce/virtle"
license=('unknown')
groups=()
depends=('libvirt' 'virt-manager' 'sed' 'bash')
makedepends=('git')
provides=(virtle)
conflicts=(virtle)
replaces=()
backup=(etc/virtle.conf)
options=()
install=
source=("$pkgname::git://github.com/DMBuce/${pkgname%-git}.git")
#source=("$pkgname::git+ssh://git@mantrid/~/${pkgname%-git}.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  make prefix=/usr sysconfdir=/etc localstatedir=/var
}

package() {
  cd "$srcdir/$pkgname"
  make prefix=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
