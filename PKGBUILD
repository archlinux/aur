# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Brad Fanella <bradfanella@achlinux.us>

pkgname=balsa-gtk2
_pkgname=balsa
pkgver=2.4.12
pkgrel=1
pkgdesc="An e-mail client for GNOME (GTK2 version)"
arch=('i686' 'x86_64')
url="http://pawsa.fedorapeople.org/balsa/"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('gmime' 'libwebkit' 'libesmtp' 'libnotify' 'gtksourceview2' 'gtkspell' 'libcanberra'
		'desktop-file-utils')
makedepends=('perlxml' 'gnome-doc-utils' 'intltool')
install=$_pkgname.install
source=(http://pawsa.fedorapeople.org/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('3f72fc69bb7fecb59e64c4cb88dc5083ed58dc76c9345b22d6c15af2c6b1e3c4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
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
