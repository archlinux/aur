# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-editdistance
pkgname=('python-editdistance' 'python2-editdistance')
pkgver=0.5.2
pkgrel=1
pkgdesc="Fast implementation of the edit distance(Levenshtein distance)"
arch=('x86_64')
license=('MIT')
url="https://github.com/aflc/editdistance"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/aflc/editdistance/archive/v$pkgver.tar.gz"
        LICENSE)
sha512sums=('62f3147c8ae77d2fb22259020b7d12e026dfb044e23e37e85d230539a3a160464d8735e5b1bb6d90eded1688ee026bb32513e9ab3661542ded6ede848060c457'
            '590232c1e7fa5aaaaa77573c4ea23533522177ca0ac07a0ce7f00e446d47467df2e19936ecb5e057fddc664d1daca39e2217cb5f6e3192ef5edf49b1f73e0f10')

build() {
  cd editdistance-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd editdistance-$pkgver
  python setup.py nosetests
  python2 setup.py nosetests
}

package_python-editdistance() {
  depends=('python')

  cd editdistance-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-editdistance() {
  depends=('python2')

  cd editdistance-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
