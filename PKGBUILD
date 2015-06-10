# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bluefish-svn
pkgver=8547
pkgrel=1
pkgdesc="SVN version of the programmer's HTML editor written using GTK"
arch=('i686' 'x86_64')
url="http://bluefish.openoffice.nl/"
license=('GPL')
depends=('aspell>=0.60.4-2' 'libxml2' 'gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'perl-xml-libxml' 'pkgconfig' 'subversion' 'automake' 'autoconf' 'libtool')
optdepends=('python2: for self written extensions')
provides=('bluefish')
conflicts=('bluefish')
install=$pkgname.install
source=(svn+svn://svn.code.sf.net/p/bluefish/code/trunk/bluefish)

pkgver() {
  cd "${srcdir}/bluefish"
   svnversion | tr -d [A-z]
}

build() {
  cd "${srcdir}"/bluefish

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --exec-prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-freedesktop_org-menu=/usr/share/applications \
    --with-freedesktop_org-mime=/usr/share/mime \
    --without-gnome2_4-mime \
    --without-gnome2_4-appreg \
    --with-icon-path=/usr/share/pixmaps \
    --disable-update-databases \
    --disable-xml-catalog-update
  make
}

package() {
  cd "${srcdir}"/bluefish

  make DESTDIR="${pkgdir}" install
}
md5sums=('SKIP')
