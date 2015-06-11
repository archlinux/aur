# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmclock
pkgver=1.0.14
pkgrel=1
pkgdesc="Dockable clock applet for Window Maker"
arch=('i686' 'x86_64')
url="http://www.bluestop.org/wmclock/"
license="GPL"
depends=('libxpm')
optdepends=('windowmaker')
makedepends=('imake')
source=("http://www.bluestop.org/wmclock/${pkgname}-${pkgver}.tar.gz"
        "fix_12_year_display.patch"
        "manpage_fixes.patch"
        "manpage_xpm_notes.patch")
md5sums=('15a83f45e2baabec26b22a2153aa2417'
         '3063f4dd017b24046ba9d0c932d85583'
         'cff551b14bab22daad6f546602ddb90a'
         '7e716bc8b110a41e548f7bbaf707b2b9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  for patch in ${srcdir}/*.patch ; do
    patch -Np1 -i "${patch}"
  done

  ./configure --prefix=/usr \
      --mandir=/usr/share/man \
      --sharedir=/usr/share
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install.man
  make DESTDIR=${pkgdir}/usr install.share
  install -Dm644 README ${pkgdir}/usr/share/doc/wmclock/README
}

