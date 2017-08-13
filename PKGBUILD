# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pyethereum
pkgver=1.6.0
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
md5sums=('ed488fb2fb46efdc9dfdbc643b4dc181')
sha256sums=('21486b6c6430c79b61405508353d3aeae6ad70ec646849501d5a44779769be82')

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
