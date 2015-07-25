# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-bitcoin
pkgver=1.1.33
pkgrel=1
pkgdesc="Python Bitcoin Tools"
arch=('any')
depends=('python2' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('02797eca548c91d3b269a9de433d2f59')
sha256sums=('72471b71575b80f7c767c3d643893416c50efbd8061192c14dced518e1c1ea12')
provides=('pybitcointools2' 'pybtctool2' 'python2-bitcoin' 'python2-pybitcointools')
conflicts=('pybitcointools2' 'pybtctool2' 'python2-pybitcointools' 'python2-python-bitcoinlib')

prepare(){
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing setup.py...'
  sed -i '/data_files.*/d' setup.py

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Renaming pybtctool to pybtctool2...'
  mv "$pkgdir/usr/bin/pybtctool" "$pkgdir/usr/bin/pybtctool2"
}
