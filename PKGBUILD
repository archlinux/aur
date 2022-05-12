# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=bluefish-svn
pkgver=r8904
pkgrel=1
pkgdesc="SVN version of the programmer's HTML editor written using GTK"
arch=('i686' 'x86_64')
url="http://bluefish.openoffice.nl/"
license=('GPL')
depends=('gtk3' 'enchant')
makedepends=('intltool' 'perl-xml-libxml' 'pkgconfig' 'subversion' 'automake' 'autoconf' 'libtool')
optdepends=('python: for self written extensions')
provides=('bluefish')
conflicts=('bluefish')
source=(svn+svn://svn.code.sf.net/p/bluefish/code/trunk/bluefish)

pkgver() {
  cd "${srcdir}/bluefish"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
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
    --with-icon-path=/usr/share/pixmaps \
	--enable-spell-check \
    --disable-update-databases \
    --disable-xml-catalog-update
  make
}

package() {
  cd "${srcdir}"/bluefish

  make DESTDIR="${pkgdir}" install
}
md5sums=('SKIP')
