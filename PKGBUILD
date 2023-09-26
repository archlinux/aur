# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>

pkgname=balsa-gtk2
_pkgname=balsa
pkgver=2.4.14
pkgrel=5
pkgdesc="An e-mail client for GNOME (GTK2 version)"
arch=('i686' 'x86_64')
url='http://pawsa.fedorapeople.org/balsa/'
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('gmime' 'webkitgtk2' 'libesmtp' 'libnotify' 'gtksourceview2' 'gtkspell' 'libcanberra'
		'desktop-file-utils' 'enchant1')
makedepends=('gnome-doc-utils' 'intltool')
source=(http://pawsa.fedorapeople.org/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('9de197c3adf2cfa1ddf8c3b6da11e5b06f58b27a917e064de34621d5f9210522')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --with-html-widget=webkit \
      --with-gtksourceview=yes \
      --with-canberra=yes \
      --with-gnome=no \
      --with-gss=yes \
      --with-nm=no \
      --with-ssl=yes
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make GTK_UPDATE_ICON_CACHE=/bin/true DESTDIR="${pkgdir}" install
}
