# Maintainer: Xyne
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>
pkgname=bkchem
pkgver=0.14.0_pre2
pkgver_=0.14.0-pre2
pkgrel=3
pkgdesc="Chemical drawing program"
arch=('i686' 'x86_64')
url="http://bkchem.zirael.org"
license=('GPL')
depends=('python2' 'tcl' 'tk')
source=(http://bkchem.zirael.org/download/$pkgname-$pkgver_.tar.gz
        bkchem.install
        bkchem.desktop)
install=bkchem.install
optdepends=("pycairo: alternative PNG/PDF export"
            "inchi: InChI generation")

prepare() {
  cd "$srcdir/$pkgname-$pkgver_"
  # Update for Python2
  sed -i 's/python/python2/g' setup.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver_"
  python2 setup.py install \
    --prefix=/usr \
    --root="$pkgdir" \
    --strip="$pkgdir"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

sha1sums=('9c17e8cbd0443d55b82c32f27f5965dd014033c5'
          'eeb36aefd2b680ff018bb0f7ac55b7b6a45f564e'
          '0ec695c51ac51092d6665e3ccb14d4f53d7af3aa')
