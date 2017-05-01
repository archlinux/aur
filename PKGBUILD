# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-counterparty-lib
pkgver=9.55.2
pkgrel=1
pkgdesc="Counterparty Protocol Reference Implementation"
arch=('any')
depends=('python'
         'python-appdirs'
         'python-apsw'
         'python-cachetools'
         'python-colorlog'
         'python-crypto'
         'python-dateutil'
         'python-flask'
         'python-flask-httpauth'
         'python-json-rpc'
         'python-pycoin'
         'python-pysha3'
         'python-pytest'
         'python-pytest-cov'
         'python-python-bitcoinlib'
         'python-requests'
         'python-tendo'
         'python-tornado'
         'python-xmltodict'
         'sqlite')
makedepends=('python-setuptools')
optdepends=('ethereum: compile Solidity contract code'
            'ethereum-serpent: compile Serpent contract code')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterparty-lib"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/counterparty-lib/tar.gz/$pkgver
        setup.py.patch)
sha256sums=('14889f1beae3055b98e88157a4e5c906632cf3ddd20357b28f6298001c8d9e57'
            '7cccdbf298c2d454c835e4f97009a4df583895709b872a1b4d5c0efd30251123')

prepare() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Fixing setup.py...'
  patch -p1 < "$srcdir/setup.py.patch"
}

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
