# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-editdistance-s
pkgver=1.0.0
pkgrel=5
pkgdesc="Fast implementation of the edit distance (Levenshtein distance)"
url="https://github.com/asottile/editdistance-s"
license=('MIT')
arch=('x86_64')
depends=('python-cffi')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/asottile/editdistance-s/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('148234a38f54f70a2d6bc64f6a166a8954c79fb89d5f5c0bf3f041fe60056332901484a0626e218a72ae992f476305cbb662dfa0acdda794727fc682c569d718')

build() {
  cd editdistance-s-$pkgver
  python setup.py build
}

check() {
  cd editdistance-s-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-311" pytest
}

package() {
  cd editdistance-s-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
