# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-ckcc-protocol
_pkgname=ckcc-protocol
pkgver=1.0.0
pkgrel=1
pkgdesc="Python code and command utilities to communicate with coldcard cryptocurrency wallet"
arch=('any')
depends=(python 'python-hidapi<0.9.0.1' python-click python-pyaes python-ecdsa)
makedepends=()
url="https://github.com/Coldcard/ckcc-protocol"
license=('custom')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/Coldcard/ckcc-protocol/archive/v$pkgver.tar.gz)
sha256sums=('297aee0d24df98357cd1302b64ca560eb29309dd1b3ec981d68a61e399da4cb3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm0644 51-coinkite.rules "${pkgdir}/usr/lib/udev/rules.d/51-coinkite.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
