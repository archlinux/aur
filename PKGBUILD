# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=drobo-utils
pkgver=0.6.2
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="A library, GUI and CLI script for managing Data Robotics storage units on Linux"
arch=(any)
url="http://drobo-utils.sourceforge.net/"
license=('GPL3')
depends=('python' 'pyqt' 'parted')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/r${_pkgver}/${pkgname}-${pkgver}.1.tgz)
md5sums=('ea1d43aeeabe203f38546bbc8ed97156')
sha1sums=('596e6337d95cd992a8cf0711287bb7ac16384fc8')

build() {
  cd "$srcdir/$pkgname-$pkgver.1"

  python setup.py install --root=$pkgdir #--prefix=$pkgdir/usr || return 1

  # Install some more stuff
  install -Dm644 drobom.8 $pkgdir/usr/share/man/man8/drobom.8 || return 1
  install -Dm644 droboview.8 $pkgdir/usr/share/man/man8/droboview.8 || return 1
  for f in CHANGES.txt DEVELOPERS.txt README.txt; do
    install -Dm644 $f $pkgdir/usr/share/doc/$pkgname/$f || return 1
  done
}
