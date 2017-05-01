# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterparty-cli
pkgver=1.1.3
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
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/$pkgname/tar.gz/$pkgver
        setup.py.patch)
sha256sums=('a79bd99c94bc61340660bf94d33015b617caef9d5d1f48b4a2964a746aa1348b'
            'd5cb63b282dc013c6f57a14891eadaf81cc9196fbcc916a9cee5a4a8dcdd1bf2')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing setup.py...'
  patch -p1 < "$srcdir/setup.py.patch"
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
