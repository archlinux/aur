# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Florijan Hamzic <florijanh@gmail.com>

pkgname=python38-cairocffi
pkgver=1.4.0
pkgrel=1
pkgdesc="cairocffi is a CFFI-based drop-in replacement for Pycairo, a set of Python bindings and object-oriented API for cairo."
arch=('any')
url="https://cairocffi.readthedocs.io/"
license=('BSD')
depends=('python38-cffi' 'cairo' 'python38-xcffib')
makedepends=('python38-setuptools' 'gdk-pixbuf2')
checkdepends=('python38-pytest' 'python38-numpy' 'python38-pikepdf')
optdepends=('gdk-pixbuf2: for cairocffi.pixbuf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kozea/cairocffi/archive/v${pkgver}.tar.gz")
sha512sums=('5622aa50d33cbd206c9fb1da33f5c832e9b38a4d679e410c0ced8c75387524c58cb63daf0194e5e5b1c9700b55060471e38c672d7496efc9fc75638866e0a2dc')

build() {
  cd cairocffi-$pkgver
  python3.8 setup.py build
}

check() {
  cd cairocffi-$pkgver
  PYTHONPATH="$PWD/build/lib" pytest build
}

package() {
  cd cairocffi-$pkgver
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
