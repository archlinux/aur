# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-panel-git
_pkgname=gnome-panel
pkgver=3.20.0.r18.g8ab4e78
pkgrel=1
pkgdesc="Panel of GNOME Flashback (git version)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/GnomePanel"
license=('GPL')
depends=('evolution-data-server' 'gnome-desktop' 'gnome-menus' 'libwnck3')
makedepends=('git' 'autoconf-archive' 'intltool' 'gtk-doc' 'yelp-tools' 'gobject-introspection')
optdepends=('alacarte: Main menu editor'
            'gnome-applets: Extra applets for the panel')
conflicts=($_pkgname)
provides=($_pkgname)
source=(git://git.gnome.org/gnome-panel)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
               --disable-schemas-compile --disable-Werror
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
