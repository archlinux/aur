_pkgname=gnome-credentials
pkgname=$_pkgname-git
pkgver=0.1+225+gd68a66c
pkgrel=1
pkgdesc="Passwords & keys"
arch=(i686 x86_64)
license=(GPL)
url="https://wiki.gnome.org/Design/Apps/Credentials"
depends=(gtk3)
makedepends=(intltool git vala gobject-introspection)
replaces=($_pkgname)
provides=($_pkgname-$pkgver)
conflicts=($_pkgname)
groups=(gnome-extra)
source=('git+https://git.gnome.org/browse/gnome-credentials')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  _count=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short HEAD)
  echo 0.1+$_count+g$_commit
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr --disable-Werror
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
