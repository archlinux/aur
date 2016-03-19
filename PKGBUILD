# Maintainer: willemw <willemw12@gmail.com>

_pkgname=podget
pkgname=$_pkgname-cvs
pkgver=20160319
pkgrel=1
pkgdesc="Simple tool to automate downloading of podcasts"
arch=('any')
url="http://podget.sourceforge.net/"
license=("GPL3")
depends=('wget')
makedepends=('cvs')
provides=($_pkgname)
conflicts=($_pkgname)
#source=()
#md5sums=('SKIP')

#_cvsroot=:pserver:anonymous:@podget.cvs.sourceforge.net:/cvsroot/podget
#_cvsmod=podget

pkgver() {
  date +%Y%m%d
}

prepare() {
  cvs -z3 -d:pserver:anonymous:@podget.cvs.sourceforge.net:/cvsroot/podget co -P podget
  find $_pkgname -type d -name CVS -exec rm -r {} +
}

package() {
  cd $_pkgname

  make prefix=/usr DESTDIR="$pkgdir" changelog.gz install

  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"

  cp -r SCRIPTS/ "$pkgdir/usr/share/$pkgname/scripts/"
  find "$pkgdir/usr/share/$pkgname/scripts/" -type d -exec chmod 755 '{}' \;
  find "$pkgdir/usr/share/$pkgname/scripts/" -type f -exec chmod 644 '{}' \;
}

