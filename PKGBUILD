# Maintainer: malacology

pkgname=popart
pkgver=1.7
pkgrel=1
pkgdesc="free population genetics software"
arch=('x86_64')
url="http://popart.otago.ac.nz/index.shtml"
license=('custom')
depends=('marble' 'lpsolve' 'qt5-base')
makedepends=('git')
source=("git+https://github.com/jessicawleigh/popart-current.git" "popart.desktop")
md5sums=('SKIP'
         '44802b43fa5dba142dbb20cc32e15f45')


package() {
  cd $srcdir/${pkgname}-current
  qmake -makefile LPSOLVEDIR=/usr/bin/lp_solve MARBLEDIR=/usr/bin/marble popart.pro
  make
  install -d "$pkgdir"/usr/{bin,share/{popart,applications}}
  mv "$srcdir"/popart-current/* "$pkgdir"/usr/share/popart
  ln -s /usr/share/popart/popart "$pkgdir"/usr/bin/popart
  install -Dm755 ${srcdir}/popart.desktop ${pkgdir}/usr/share/applications/popart.desktop
}
