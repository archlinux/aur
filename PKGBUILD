# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Maintainer: Fabien Loison <contact@flozz.fr>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
pkgver=4.17.0
pkgrel=1
pkgdesc='CLI tool and Python library to configure SteelSeries gaming mice'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
makedepends=('python-build' 'python-pip' 'python-setuptools')
depends=('python' 'hidapi' 'python-hidapi')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('702b80928103119c26c9bd19e55ac9b07052c6eaeb06d3b423323c0c0164740142dba9a3484cd0501952371c09d275534c6848aba54d564a34be85494e78aefc')
install=install
build() {
  cd $pkgname-$pkgver
  python -m build --sdist
}

package() {
  cd $pkgname-$pkgver

  # python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  pip install --prefix="$pkgdir" --root-user-action=ignore --ignore-installed --no-deps .

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mv "$pkgdir"/lib "$pkgdir"/usr/lib
  mv "$pkgdir"/bin "$pkgdir"/usr/bin
}
