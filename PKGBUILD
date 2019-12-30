# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-tqdm
pkgver=4.41.0
pkgrel=1
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL')
url='https://github.com/tqdm/tqdm'
makedepends=('python2-setuptools')
checkdepends=('python2-nose' 'python2-coverage' 'python2-flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tqdm/tqdm/archive/v$pkgver.tar.gz")
sha512sums=('15615079e3df877836b37c7699191a562ce052b82fcb4d1b5f666e17c82264354e17237fbee1d5965dd891ab3646cd6dd0ed808e994de3f84fedb82d8aa1b3e3')

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
