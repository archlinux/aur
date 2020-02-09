# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
pkgver=3.8.0
pkgrel=1
pkgdesc='SteelSeries Rival gaming mouse configuration utility'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('caf7395fe8ddce02fd3e9d54f7a9e063258e3ee84e4cbccc647cfc436ce55ef2ca2c5c27cbbae562fd48903875c3d7e58196c537373bcc5f67eb8d064cf8f94f')

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
