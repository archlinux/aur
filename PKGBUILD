#Maintainer: Lubosz <lubosz@gmail.com>
#Contributor: helq <linuxero789@gmail.com>

pkgname=gsettings-desktop-schemas-git
_realpkgname=gsettings-desktop-schemas
pkgver=3.8.0.5.gca797db
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(i686 x86_64)
url="http://live.gnome.org/"
license=('GPL')
depends=('glib2-git' 'intltool')
makedepends=('git')
options=(makeflags !emptydirs)

provides=("${_realpkgname}")
conflicts=("${_realpkgname}")

source="git://git.gnome.org/gsettings-desktop-schemas"
sha256sums=('SKIP')

_gitname="gsettings-desktop-schemas"
install=gsettings-desktop-schemas.install

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
   ./autogen.sh --prefix=/usr || return 1
   make || return 1
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir install || return 1
}
