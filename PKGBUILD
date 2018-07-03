# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pynamecheap
pkgname=(python-pynamecheap python2-pynamecheap)
pkgver=0.0.3
pkgrel=2
pkgdesc="Namecheap API client in Python"
url="https://github.com/Bemmu/PyNamecheap"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools' 'python-requests' 'python2-requests')
checkdepends=('python-nose' 'python2-nose')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Bemmu/PyNamecheap/archive/v$pkgver.tar.gz")
sha512sums=('9de6f09c76a85a67269465cb1e270f5533fa84983a220ba855b04d03924e2308b9267f212cc2e4811e7e4fb3542e1c1194a74e4ed7ffd253704d7a394d5e1bb2')

prepare() {
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
