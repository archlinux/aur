# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-ckcc-protocol
_pkgname=ckcc-protocol
pkgver=0.7.5
pkgrel=1
pkgdesc="Python code and command utilities to communicate with coldcard cryptocurrency wallet"
arch=('any')
depends=(python)
makedepends=()
url="https://github.com/Coldcard/ckcc-protocol"
license=('custom')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/Coldcard/ckcc-protocol/archive/v$pkgver.tar.gz)
sha256sums=('2ab3c4f838999b51d4d7ad5ded43e89a50fe1a5ba5903f36e0188952324a354b')

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
