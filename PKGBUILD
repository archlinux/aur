# Maintainer: Sam  <dev at samarthj dot com>

# shellcheck disable=2034,2148,2154

pkgname=python-tinyaes
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc="A utility to find python versions on your system."
arch=("any")
url="https://github.com/naufraghi/tinyaes-py.git"
license=("MIT")
depends=("cython")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('38084eb8ea07526e5cfec1f3aa7ad0d073c5479908944213402574bbe11881fa51349f7edc1ae8f078db3c13c880f4b72a145977eb2012ffa8e1c521fca7548b')
b2sums=('05bfd3f0506ac293b3f2c2be71696fe1261c385d739e0df68eaa54b7d7d518a00ce05491efe84b5d2c4db25d8ed1bdc64601dac75d4e65c8f1d83f4e5f0eb4f5')

build() {
  cd "$srcdir/${_name}-$pkgver" || exit 1
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/${_name}-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
