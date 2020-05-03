# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
pkgver=3.11.0
pkgrel=1
pkgdesc='SteelSeries Rival gaming mouse configuration utility'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2aa4b62c26ebab2cd2f090f64edb314b611e4ad65d0726621c196c461d720eda4b28e2cdd159cdbc9beded7fe4c1f98c4ee301be143af1669556efcad61abbc4')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 doc/rival-spec.md "$pkgdir"/usr/share/doc/$pkgname/rival-spec.md
  install -Dm 644 doc/rival100-spec.md "$pkgdir"/usr/share/doc/$pkgname/rival-spec100.md
  install -Dm 644 doc/rival300-spec.md "$pkgdir"/usr/share/doc/$pkgname/rival-spec300.md
  install -Dm 644 $pkgname/data/99-steelseries-rival.rules "$pkgdir"/etc/udev/rules.d/99-steelseries-rival.rules
}
