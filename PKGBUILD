# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=black
pkgver=18.3a4
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url=https://github.com/ambv/black
license=('MIT')
depends=('python-attrs' 'python-click')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/ambv/black/18.3a4/tests/debug_visitor.out')
sha512sums=('7e134a28bee2efbc3408f0042023be1a4fa0033321755ef15ec90116e114282ae4ce53d032210859e391d96d54ccadb0580444e5de56666714318e0b596db0fc'
            '66f78c65192f7c43639c3169aabbf13b098e53ebfe237395af01ceec4814ce2ca412f2a3735e24dcca0449792ef33d1f1c9061e7b69047be7117cecaea71f8a1')

prepare() {
  mv debug_visitor.out black-$pkgver/tests
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
