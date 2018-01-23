# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pynamecheap
pkgname=(python-pynamecheap python2-pynamecheap)
pkgver=0.0.2
_commit=8e5455180c83db0d66ecd80451bc103744ec9012
pkgrel=1
pkgdesc="Namecheap API client in Python"
url="https://github.com/Bemmu/PyNamecheap"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$_commit.tar.gz::https://github.com/Bemmu/PyNamecheap/archive/$_commit.tar.gz")
sha512sums=('77a233dfed4e2c70ecc9617cf2655976e07149533b497bef75e7099c3284942cd3017d828d517d36d6fc40cfc10f50a71cd135f77da428b4e990277f877a2522')

prepare() {
  mv PyNamecheap-{$_commit,$pkgver}
  cp -a PyNamecheap-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/PyNamecheap-$pkgver
  python setup.py build

  cd "$srcdir"/PyNamecheap-$pkgver-py2
  python2 setup.py build
}

check() {
  # Needs an account

  cd "$srcdir"/PyNamecheap-$pkgver
  python setup.py nosetests || warning "Tests failed"

  cd "$srcdir"/PyNamecheap-$pkgver-py2
  python2 setup.py nosetests || warning "Tests failed"
}

package_python-pynamecheap() {
  depends=('python-requests')

  cd PyNamecheap-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-pynamecheap() {
  depends=('python2-requests')

  cd PyNamecheap-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
