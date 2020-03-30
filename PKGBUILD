# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-tqdm
pkgver=4.44.1
pkgrel=1
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL')
url='https://github.com/tqdm/tqdm'
makedepends=('python2-setuptools')
checkdepends=('python2-nose' 'python2-coverage' 'python2-flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tqdm/tqdm/archive/v$pkgver.tar.gz")
sha512sums=('7661cddb340c2a28f01d2b8ebd3f2041a28398b16259d227ba6ec99f08b8be48b267cef913b104a1cea89147ef062fb7af9c84bf06ffb0f2834d4e2aab6e6359')

prepare() {
  mv tqdm-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/tqdm-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/tqdm-$pkgver-py2
  python2 setup.py nosetests --ignore-files="tests_perf\.py"
}

package() {
  cd tqdm-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE

  mv "$pkgdir"/usr/bin/tqdm{,2}
}

# vim:set ts=2 sw=2 et:
