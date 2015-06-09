# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=bijiben
pkgname=$_pkgname-git
pkgver=3.17.2.r2.g5b079d0
_realver=3.17.2
pkgrel=1
pkgdesc="Write out notes, every detail matters"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Bijiben"
license=('GPL')
depends=("gtk3" "glib2" "libtracker-sparql" 'libzeitgeist' 'webkitgtk3' 'dconf' 'desktop-file-utils' 'hicolor-icon-theme'
	 "evolution-data-server>=3.13.90" "evolution" "libxml2")
makedepends=('intltool' 'itstool' 'appstream-glib' 'git' 'gnome-common')
options=('!libtool')
provides=("${_pkgname}=${_realver}")
conflicts=("${_pkgname}")
replace=("${_pkgname}")
install=$_pkgname.install
source=('git://git.gnome.org/bijiben')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -E 's/^BIJIBEN_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  # :git clone gnome:libgd
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$_pkgname --disable-static \
	--disable-schemas-compile --disable-update-mimedb
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
