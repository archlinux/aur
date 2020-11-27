# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-tqdm
pkgver=4.54.0
pkgrel=1
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL')
url='https://github.com/tqdm/tqdm'
makedepends=('python2-setuptools')
checkdepends=('python2-nose' 'python2-coverage' 'python2-flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tqdm/tqdm/archive/v$pkgver.tar.gz")
sha512sums=('1cb70d351e1b9ea1b378aae2bdd767f839e89f591cae1a554afb925e43c935c2539a990ca59f8083dcd362f13afc835d8c1346852f61aac3183adc567c498217')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  mv tqdm-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/tqdm-$pkgver-py2
  python2 setup.py build
}

package() {
  cd tqdm-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE

  mv "$pkgdir"/usr/bin/tqdm{,2}
}

# vim:set ts=2 sw=2 et:
