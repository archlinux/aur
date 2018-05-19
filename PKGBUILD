# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=black
pkgver=18.5b0
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url=https://github.com/ambv/black
license=('MIT')
depends=('python-attrs' 'python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/ambv/black/18.5b0/tests/stub.pyi')
sha512sums=('b4da4ab22ffbbf5ce3ae763bacfaab2263e4d69a1c5583073b60670e5d6f89d240bd9badcb151ceb11cd7ac951f51c3a6b9ecb67c8b5ddfac7b3308d96675f36'
            '31f54cd737b97657884c5195d29a42929d861d637fe19851ed257c4c80cd37ce075fe70cc5590c9f2706e717248982326170e1d3b2f613c7ee2c047ae2333b5f')

prepare() {
  cp -n stub.pyi black-$pkgver/tests
}

build() {
  cd black-$pkgver
  python setup.py build
}

check() {
  cd black-$pkgver
  python -m unittest tests/test_black.py
}

package() {
  cd black-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/black/LICENSE
}

# vim:set ts=2 sw=2 et:
