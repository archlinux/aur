# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Gary van der Merwe <garyvdm@gmail.com>

pkgname=ino
pkgver=0.3.6
pkgrel=8
pkgdesc="Command line toolkit for working with Arduino hardware"
arch=(any)
url="http://inotool.org/"
license=('MIT')
depends=('python2' 'python2-pyserial' 'python2-jinja' 'python2-configobj'  'python2-six'
         'arduino10' 'picocom' 'avrdude')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/i/${pkgname}/${pkgname}-${pkgver}.tar.gz 'fix-avrdude-conf.patch'
        'cppoption1.patch::https://github.com/maharifu/ino/commit/e5be3c6779892514cf8fc491ed927d36f292a2f9.diff' )
md5sums=('d2ca04f862ded04b19a5473467aff146'
         'cb70daaa535a5eb1d14f932014be70f4'
         'dfdf748eb0c8c349d2701008cc28be5d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/fix-avrdude-conf.patch"
  patch -p1 < "$srcdir/cppoption1.patch"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
