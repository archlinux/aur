# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-editdistance
pkgname=('python-editdistance' 'python2-editdistance')
pkgver=0.4
pkgrel=2
pkgdesc="Fast implementation of the edit distance(Levenshtein distance)"
arch=('x86_64')
license=('MIT')
url="https://github.com/aflc/editdistance"
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/aflc/editdistance/archive/v$pkgver.tar.gz"
        LICENSE)
sha512sums=('8487d5aa2c516e4ee0aea2a63670ebd512cd443eb48c1ca99a7fe334518c0731c33ddb97ce158f5afe665a739d69c86bc247c49ad2489839cc60566385aeaf5d'
            '590232c1e7fa5aaaaa77573c4ea23533522177ca0ac07a0ce7f00e446d47467df2e19936ecb5e057fddc664d1daca39e2217cb5f6e3192ef5edf49b1f73e0f10')

prepare() {
  cp -a editdistance-$pkgver{,-py2}

  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd "$srcdir"/editdistance-$pkgver
  python setup.py build

  cd "$srcdir"/editdistance-$pkgver-py2
  python2 setup.py build
}

package_python-editdistance() {
  depends=('python')

  cd editdistance-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-editdistance() {
  depends=('python2')

  cd editdistance-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
