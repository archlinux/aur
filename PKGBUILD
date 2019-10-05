# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-ckcc-protocol
_pkgname=ckcc-protocol
pkgver=0.7.11
pkgrel=1
pkgdesc="Python code and command utilities to communicate with coldcard cryptocurrency wallet"
arch=('any')
depends=(python)
makedepends=()
url="https://github.com/Coldcard/ckcc-protocol"
license=('custom')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/Coldcard/ckcc-protocol/archive/v$pkgver.tar.gz)
sha256sums=('58f615bafc1a5f15c0a73cce9d967b5eca3cd70a929c13808c8f4b3e3b814087')

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
