# Maintainer: malacology

pkgname=popart
pkgver=2019.07.15
pkgrel=1
pkgdesc="Full-feature software for haplotype network reconstruction. https://doi.org/10.1111/2041-210X.12410"
arch=('x86_64')
url="http://popart.otago.ac.nz/index.shtml"
license=('LGPLv2')
depends=('marble' 'lpsolve' 'qt5-base' 'suitesparse')
makedepends=('git')
source=("git+https://github.com/jessicawleigh/popart-current.git" "popart.desktop")
md5sums=('SKIP'
         '44802b43fa5dba142dbb20cc32e15f45')
pkgver(){
  cd $srcdir/${pkgname}-current
  printf $(TZ=UTC git log --no-walk --pretty="%cd" --decorate=full --date=format-local:%Y.%m.%d | head -n 1)
}
build() {
  cd $srcdir/${pkgname}-current
  qmake -makefile LPSOLVEDIR=/usr/bin/lp_solve MARBLEDIR=/usr/bin/marble popart.pro
  make
}

package() {
  install -d "$pkgdir"/usr/{bin,share/{popart,applications}}
  mv "$srcdir"/popart-current/* "$pkgdir"/usr/share/popart
  ln -s /usr/share/popart/popart "$pkgdir"/usr/bin/popart
  install -Dm755 ${srcdir}/popart.desktop ${pkgdir}/usr/share/applications/popart.desktop
}
