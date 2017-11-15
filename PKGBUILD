# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-editdistance
pkgname=('python-editdistance' 'python2-editdistance')
pkgver=0.3.1
_commit=3ea84a7dd3258c76aa3be851ef3d50e59c886846
pkgrel=1
pkgdesc="Fast implementation of the edit distance(Levenshtein distance)"
arch=('x86_64')
license=('MIT')
url="https://github.com/aflc/editdistance"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
source=("git+https://github.com/aflc/editdistance.git#commit=$_commit"
        LICENSE)
sha512sums=('SKIP'
            '590232c1e7fa5aaaaa77573c4ea23533522177ca0ac07a0ce7f00e446d47467df2e19936ecb5e057fddc664d1daca39e2217cb5f6e3192ef5edf49b1f73e0f10')

prepare() {
  cp -a editdistance{,-py2}

  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd "$srcdir"/editdistance
  python setup.py build

  cd "$srcdir"/editdistance-py2
  python2 setup.py build
}

package_python-editdistance() {
  depends=('python')

  cd editdistance
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-editdistance() {
  depends=('python2')

  cd editdistance-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
