# Maintainer: malacology

pkgname=popart
pkgver=1.7
pkgrel=1
pkgdesc="free population genetics software"
arch=('x86_64')
url="http://popart.otago.ac.nz/index.shtml"
license=('custom')
dependence=(marble lpsolve qt5-base)
source=("git+https://github.com/jessicawleigh/popart-current.git" "popart.desktop")
md5sums=('SKIP'
         '9e8d5341ab796a37b8c0bb553a6656a7')


package() {
  cd $srcdir/${pkgname}-current
  qmake -makefile LPSOLVEDIR=/usr/bin/lp_solve MARBLEDIR=/usr/bin/marble popart.pro
  make
  install -d "$pkgdir"/usr/{bin,share/{popart,applications,icons}}
  mv "$srcdir"/popart-current/icons/* "$pkgdir"/usr/share/icons
  mv "$srcdir"/popart-current/* "$pkgdir"/usr/share/popart
  ln -s /usr/share/popart/popart "${pkgdir}"/usr/bin/popart
}
