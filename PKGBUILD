# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Schala <schalaalexiazeal@gmail.com>

pkgname=python2-enum34
pkgver=1.1.10
pkgrel=2
pkgdesc='Python 3.4 Enum backported'
arch=('any')
url='https://pypi.org/project/enum34'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/e/enum34/enum34-$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('cce6a7477ed816bd2542d03d53db9f0db935dd013b70f336a95c73979289f248'
            'edee8134057d81b366a002e63a7e1f99536b75436ef54864e06f9925b9c06d74')

prepare() {
  patch -p1 -d "enum34-$pkgver" setup.py < 001-setup.py.patch
}

build() {
  cd "enum34-$pkgver"
  python2 setup.py build
}

package() {
  export PYTHONHASHSEED=0
  cd "enum34-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 enum/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 enum/README -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim: ts=2 sw=2 et:
