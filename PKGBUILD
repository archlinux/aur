# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-ckcc-protocol
_pkgname=ckcc-protocol
pkgver=1.5.0
pkgrel=1
pkgdesc="Python code and command utilities to communicate with coldcard cryptocurrency wallet"
arch=('any')
depends=(python python-hidapi python-click python-pyaes python-ecdsa)
makedepends=(python-setuptools)
url="https://github.com/Coldcard/ckcc-protocol"
license=('custom')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/Coldcard/ckcc-protocol/archive/v$pkgver.tar.gz)
sha256sums=('c9733e68caf12afb1273d1c17d31aa7b83fcedf66d4bb228b84e1525f702586f')

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
