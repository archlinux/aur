# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pyethereum
pkgver=2.1.3
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
source=("https://github.com/ethereum/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('17c051bb42eaecc85ce3c830a16be3ab')
sha256sums=('da9c6d8ec0e42ea453344b3569ae66de6fc519b8baad8f93e400f31c8afc91e8')

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
