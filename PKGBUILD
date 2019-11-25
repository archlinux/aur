# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
pkgver=3.6.1
pkgrel=1
pkgdesc='SteelSeries Rival gaming mouse configuration utility'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3181b1baabb96a424aaef2c05b7b29a49cf543b59abe5051626a581f3f15a72b794e03d3e9dd0ea9ecc30f1cf499231cc9ba7d0ea98a205e2fabf96766bc2099')

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
