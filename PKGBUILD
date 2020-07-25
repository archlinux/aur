# Maintainer: Michael Schantl <floss at schantl dash lx dot at>
# Python package author: Brandon Rhodes <brandon at rhodesmill dot org>

pkgname="python-ephem"
pkgver=3.7.7.1
pkgrel=1
pkgdesc="Astronomy library for Python"
arch=("x86_64" "i686" "arm" "armv6h" "armv7h" "aarch64")
url="http://rhodesmill.org/pyephem/"
license=("LGPL")
depends=("python")
makedepends=("python-setuptools")
replaces=("python-pyephem") # Commonly used deprecated alias
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=("c3f489371febcb65da03da7ba0e08168320a6f5d81fd2355281f621074ecf2be694b2d0cc3ef7863cec617176751a34856bdd22beb66cd64129fbfb915b3dcae")
_watch="https://pypi.org/project/ephem/"

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 "$srcdir/${_name}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "$srcdir/${_name}-${pkgver}/LICENSE-GPL" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL"
  install -Dm644 "$srcdir/${_name}-${pkgver}/LICENSE-LGPL" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-LGPL"
}
