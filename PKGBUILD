# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Maintainer: Fabien Loison <contact@flozz.fr>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
pkgver=4.16.1
pkgrel=1
pkgdesc='CLI tool and Python library to configure SteelSeries gaming mice'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
makedepends=('python-build' 'python-pip' 'python-setuptools')
depends=('python' 'hidapi' 'python-hidapi')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('78840da231cd2f5581e09c1d2dcf7030248499eddd4afb48d8d037d1773f5d79148bb19ee3ca0635db085fb08e534aa211f585fe1358abc6f197767638810c6f')
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
