# Maintainer: M Jordan Stanway <aur-avl@mjstanway.com>
pkgname=avl
pkgver=3.36
pkgrel=2
pkgdesc="aerodynamic and flight-dynamic analysis of rigid aircraft using an extended vortex lattice model"
arch=('i686' 'x86_64')
url="http://web.mit.edu/drela/Public/web/avl/"
license=('GPL')
makedepends=('gcc-fortran')
depends=('gcc-libs' 'libx11' 'xorg-fonts-misc')
options=('!strip')
source=('http://web.mit.edu/drela/Public/web/avl/avl3.36.tgz' 'avl.patch')
md5sums=('61cf7ed7629142567ac8a9c9e1ba4981'
         'e85136557dad261f79a742b8fcdfe424')

prepare() {
  cd Avl
  patch -Np1 -i "$startdir/avl.patch"
}

build() {
  cd Avl/plotlib
  make gfortranDP

  cd ../eispack
  make -f Makefile.gfortran

  cd ../bin
  make -f Makefile.gfortran avl
}

package() {
  install -d "$pkgdir/usr/bin/"
  install -m 0755 "${srcdir}/Avl/bin/avl" "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/avl/"
  install -m 0644 "${srcdir}/Avl/README" "$pkgdir/usr/share/avl/"
  install -m 0644 "${srcdir}/Avl/version_notes.txt" "$pkgdir/usr/share/avl/"
  install -m 0644 "${srcdir}/Avl/avl_doc.txt" "$pkgdir/usr/share/avl/"
  install -m 0644 "${srcdir}/Avl/session1.txt" "$pkgdir/usr/share/avl/"
  install -m 0644 "${srcdir}/Avl/session2.txt" "$pkgdir/usr/share/avl/"
}
