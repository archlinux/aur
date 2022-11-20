# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-characteristic
pkgver=14.3.0
pkgrel=15
pkgdesc="Python attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/characteristic"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("https://files.pythonhosted.org/packages/source/c/characteristic/characteristic-$pkgver.tar.gz"{,.asc})
sha256sums=('ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380'
            'SKIP')
validpgpkeys=('C2A04F86ACE28ADCF817DBB7AE2536227F69F181') # Hynek Schlawack <hs@ox.cx>

prepare() {
  sed -i 's/\[pytest\]/[tool:pytest]/' characteristic-$pkgver/setup.cfg
}

build() {
  cd "$srcdir"/characteristic-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/characteristic-$pkgver
  python3.8 setup.py test
}

package_python38-characteristic() {
  cd characteristic-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
