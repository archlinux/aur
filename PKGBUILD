# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=quikman
pkgver=1.0.0
pkgrel=3
pkgdesc="A FreeBSD/Linux/Unix GUI manual viewer/reader written in Qt4"
url="https://code.google.com/p/quikman/"
arch=('x86_64' 'i686' 'aarch64')
license=('BSD')
depends=('qt4' 'man2html')
source=("https://github.com/bl00dy1837/quikman/raw/main/quikman-1.0.0.tar.gz")
sha1sums=('6b68e97120dbe8f33480e6151c71bc289cd3f269')

build() {
#  cd "${srcdir}"
  qmake-qt4 -project
  echo "target.path = \$\$INSTALL_ROOT/bin" >> src.pro
  echo "INSTALLS += target" >> src.pro
  sed -i -e "s,TARGET =,\0 quikman,g" src.pro
  qmake-qt4
  make
}

package() {
#  cd "$srcdir"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  cd ${pkgdir}
  mv bin usr/bin
}
