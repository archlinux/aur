# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pyethereum
pkgver=0.9.2
pkgrel=1
pkgdesc="Ethereum Python client"
arch=('any')
depends=('python2'
         'python2-bitcoin'
         'python2-pyethash'
         'python2-pysha3'
         'python2-repoze.lru'
         'python2-rlp'
         'python2-structlog'
         'python2-yaml')
makedepends=('python2-setuptools')
groups=('ethereum')
url="https://github.com/ethereum/pyethereum"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('960aef4540f63ccca4667f0382ad2019')
sha256sums=('0f086fcef6369f50b763f902440d2ec14645fe606ea1a5a290a50011bf579fa4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

building() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
