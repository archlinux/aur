# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-ckcc-protocol
_pkgname=ckcc-protocol
pkgver=1.3.1
pkgrel=1
pkgdesc="Python code and command utilities to communicate with coldcard cryptocurrency wallet"
arch=('any')
depends=(python 'python-hidapi' python-click python-pyaes python-ecdsa)
makedepends=()
url="https://github.com/Coldcard/ckcc-protocol"
license=('custom')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/Coldcard/ckcc-protocol/archive/v$pkgver.tar.gz)
sha256sums=('92a7d1b88cf5266a4fcc5840f0da9a4fec8fe514e01c378ddbe43a14cda23f8c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm0644 51-coinkite.rules "${pkgdir}/usr/lib/udev/rules.d/51-coinkite.rules"
  install -Dm644 COPYING-CC "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
