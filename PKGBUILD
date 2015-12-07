# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-systems
pkgver=5.4.0.20150918
_commit=0577ffca58b7fed78c1820fc1c2b7ab3533d5698
pkgrel=2
pkgdesc="Qt Publish and Subscribe Add-on Module"
arch=('i686' 'x86_64')
url="https://github.com/qtproject/qtsystems"
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt5-declarative')
makedepends=('git')
source=("git+https://github.com/qtproject/qtsystems.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd qtsystems

  qmake-qt5
  make
}

package() {
  cd qtsystems

  make INSTALL_ROOT="${pkgdir}" install

  mkdir "$pkgdir/usr/bin"
  ln -s ../lib/qt/bin/servicefw "$pkgdir/usr/bin/servicefw"
  ln -s ../lib/qt/bin/sfwlisten "$pkgdir/usr/bin/sfwlisten"

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}
