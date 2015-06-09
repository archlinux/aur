# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=gnome-panel-git
_gitname=gnome-panel
pkgver=3.16.0.r1.gcddd69b
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Legacy GNOME panel (development version)"
url="https://wiki.gnome.org/Projects/GnomeFlashback"
depends=('dconf' 'evolution-data-server' 'gconf' 'gnome-desktop' 'gnome-menus' 'librsvg'
         'libwnck3' 'telepathy-glib')
makedepends=('gobject-introspection' 'intltool' 'itstool' 'networkmanager' 'gnome-common' 'gtk-doc' 'yelp-tools' 'git')
optdepends=('gnome-applets: extra applets for the GNOME Panel')
conflicts=('gnome-panel')
provides=('gnome-panel')
install=gnome-panel.install
options=('!libtool')
source=(git://git.gnome.org/gnome-panel)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/"$_gitname" \
              --disable-static --disable-schemas-compile \
              PYTHON=/usr/bin/python2 
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

