# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-counterparty-lib-git
pkgver=20160711
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
makedepends=('git' 'python-setuptools')
optdepends=('ethereum: compile Solidity contract code'
            'ethereum-serpent: compile Serpent contract code')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterparty-lib"
license=('MIT')
options=('!emptydirs')
source=(${pkgname%-git}::git+https://github.com/CounterpartyXCP/counterparty-lib
        setup.py.patch)
sha256sums=('SKIP'
            'c5d9f4707d64718c1d19e1b08554c3e6848801b44fc650a35210cfdb441a6e98')
provides=('python-counterparty-lib')
conflicts=('python-counterparty-lib')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Fixing setup.py...'
  patch -p1 < "$srcdir/setup.py.patch"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
