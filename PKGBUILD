# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=drobo-utils
pkgver=0.6.0
pkgrel=1
pkgdesc="A library, GUI and CLI script for managing Data Robotics storage units on Linux"
arch=(any)
url="http://drobo-utils.sourceforge.net/"
license=('GPL3')
depends=('python' 'pyqt' 'parted')
makedepends=()
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${pkgver}-1.tar.gz)
md5sums=('751c4ba032c51e892b0ab75cca511a08')

build() {
  cd "$srcdir/r${pkgver//./_}"

  # Strip non-existent doc files
  grep -v drobo-utils-doc setup.py > setup.fixed.py

  python setup.fixed.py install --root=$pkgdir #--prefix=$pkgdir/usr || return 1

  # Install some more stuff
  install -Dm644 drobom.8 $pkgdir/usr/share/man/man8/drobom.8 || return 1
  install -Dm644 droboview.8 $pkgdir/usr/share/man/man8/droboview.8 || return 1
  for f in CHANGES.txt DEVELOPERS.txt README.txt; do
    install -Dm644 $f $pkgdir/usr/share/doc/$pkgname/$f || return 1
  done
}
