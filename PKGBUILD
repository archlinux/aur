# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterparty-cli
pkgver=1.1.2
pkgrel=1
pkgdesc="Counterparty Protocol Command‐Line Interface"
arch=('any')
depends=('python'
         'python-appdirs'
         'python-colorlog'
         'python-counterparty-lib'
         'python-dateutil'
         'python-prettytable'
         'python-requests')
makedepends=('python-setuptools')
optdepends=('bitcoin-core-addrindex: Bitcoin Core headless P2P node with addrindex'
            'bitcoin-headless-addrindex: Bitcoin headless wallet with addrindex'
            'bitcoin-qt-addrindex: Bitcoin-QT wallet with addrindex'
            'ethereum: compile Solidity contract code'
            'ethereum-serpent: compile Serpent contract code')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterparty-cli"
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/$pkgname/tar.gz/$pkgver)
sha256sums=('f1eef35ca55d95de78d23348c245924a08314ffd4b139cc1d2424d41618abbc1')
provides=('counterparty-cli' 'counterparty-client' 'counterparty-server')
conflicts=('counterparty-client' 'counterparty-server')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing setup.py...'
  sed -i "/'setup_requires':.*/d" setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
