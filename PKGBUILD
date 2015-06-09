# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-miniupnpc
pkgver=1.9
pkgrel=1
pkgdesc="Repack of the original miniupnp project to facilitate install via PyPi"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/chenhouwu/miniupnpc"
license=('custom')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/m/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('396f0e9a694582e422d2f140ae9781d2')
sha256sums=('498b35c5443e8de566f3a4de4bceae28fbf6e08ed59afb5ffd516d0bb718bca6')

prepare(){
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing license...'
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/python2-miniupnpc/LICENSE

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
