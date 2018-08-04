# Maintainer: James Zhu <jameszhu@berkeley.edu>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>
pkgname=python-black
_name=${pkgname#python-}
pkgver=18.6b4
pkgrel=1
pkgdesc="The uncompromising Python code formatter."
arch=('any')
url="https://github.com/ambv/black"
license=('custom:MIT')
depends=('python' 'python-attrs' 'python-click' 'python-toml' 'python-appdirs')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

check() {
  cd black-$pkgver
  python -m unittest tests/test_black.py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

sha256sums=('22158b89c1a6b4eb333a1e65e791a3f8b998cf3b11ae094adb2570f31f769a44')
