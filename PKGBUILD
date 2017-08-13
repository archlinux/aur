# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pyethereum
pkgver=1.6.1
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
md5sums=('00dd2203cc5c9bbf283c667828e23f30')
sha256sums=('9b1a29614720cbeb9c974aa30d7b114cb99e88cd4266beff252996a17a64c30c')

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
