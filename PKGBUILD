# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>

pkgname=rivalcfg
pkgver=3.12.0
pkgrel=1
pkgdesc='SteelSeries Rival gaming mouse configuration utility'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f6efe6c8a2ee574b1c54f17ee9cd77066ce3812bd9f51c3f3d86cb2588b27947043809d6cfb35c5ec527dbd28389a92acc1a0ef65e2b5cc343d978586d600995')

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
