# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: IwfY / Marcel Pfeiffer <pfeiffer.marcel at gmx dot de>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=tkcvs
pkgver=8.2.3
pkgrel=2
pkgdesc="Tcl/Tk-based graphical interface to the CVS and Subversion"
license=('GPL')
depends=('subversion' 'cvs' 'tk' 'diffutils')
arch=('i686' 'x86_64')
source=(http://www.twobarleycorns.net/tkcvs-${pkgver}.tar.gz)
url="http://www.twobarleycorns.net/tkcvs.html"
sha256sums=('4bfb29dd9ffbbbc1e6e611e1c772af745d742d336e797bf056dbf70116b8e32a')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install man pages in a Arch compliant directory
  sed -i 's/$INSTALLROOT man man1/$INSTALLROOT share man man1/g' doinstall.tcl
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

   ./doinstall.tcl -nox "${pkgdir}/usr"

   install -m 755 contrib/cvsdiff "${pkgdir}/usr/bin"
   install -m 755 contrib/tkdirdiff "${pkgdir}/usr/bin"
}
