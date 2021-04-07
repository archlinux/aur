# Contributor: Frederic Bezies <fredbezies at gmail dot com0
# Contributor: Ivo Nunes <ivoavnunes at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=birdie-git
pkgver=1.1.r12.g20b3c83
pkgrel=1
pkgdesc="Twitter client for Linux"
arch=('any')
url="https://github.com/mizhka/birdie"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'granite' 'libpurple'
	 'gtksourceview3' 'libdbusmenu-gtk3' 'webkit2gtk') 
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool'
	     'yelp-tools' 'gnome-common' 'gobject-introspection')
conflicts=('birdie' 'birdie-bzr')
provides=('birdie')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git describe --tags | sed s/+git./.r/ | sed s'/v\.//;s/-/./g')
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  DESTDIR="${pkgdir}/" make install
}
