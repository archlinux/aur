# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Maintainer: Fabien Loison <contact@flozz.fr>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
pkgver=4.16.0
pkgrel=1
pkgdesc='CLI tool and Python library to configure SteelSeries gaming mice'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
makedepends=('python-build' 'python-pip' 'python-setuptools')
depends=('python' 'hidapi' 'python-hidapi')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('dfc5b0a19dcea5cd60cddc40c43057244a3b6ce220c5602d792e5c1ae19882fb69f0028c4d26c905934d1c7721efd650cbe6401313466a28ea00bc3864b2af4d')
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
