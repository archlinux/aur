# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-counterparty-lib
pkgver=9.55.0
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
sha256sums=('f6eb9da1961dec5f5bb805fc9a90425ea429f3177abf16742af05adb63104dc8'
            'c5d9f4707d64718c1d19e1b08554c3e6848801b44fc650a35210cfdb441a6e98')

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
