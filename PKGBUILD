# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=black
pkgver=18.6b2
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url=https://github.com/ambv/black
license=('MIT')
depends=('python-attrs' 'python-click' 'python-toml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/ambv/black/18.6b2/tests/data/empty_pyproject.toml')
sha512sums=('a44a604c2ff3ff8f5a4ed43d1cee32ff756490f8c05dd9767026433ca01bae26d5421b5bea0c14e8350dacecc346158b2ed5b58c93035bfc99c402e8432a3d45'
            'f6e22306a7c72f72fc36135596826347391c963b6c49d902ee10363ab57d46c714c28243434932e1b0da41d77008c5cea5f3475d7a4a56b2484943814b4587c1')

prepare() {
  cp -n empty_pyproject.toml black-$pkgver/tests/data
}

build() {
  cd black-$pkgver
  python setup.py build
}

check() {
  cd black-$pkgver
  python -m tests.test_black
}

package() {
  cd black-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/black/LICENSE
}

# vim:set ts=2 sw=2 et:
