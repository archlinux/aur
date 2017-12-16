# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Maitnainer: Morten Linderud <morten@linderud.pw>

pkgbase=python-pychromecast
_pkgname=pychromecast
pkgname=('python-pychromecast' 'python2-pychromecast')
pkgver=1.0.3
pkgrel=1
pkgdesc='Library for Python 2 and 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('48f0d7ae9fb00f4c5c469d805ae70ff612f7b2b47399cd568d2445998da248e33879af5e80406f63c312ef75732780375aca2ab0b9abf64158b8be05d80cf0d5')

prepare() {
  cp -a $_pkgname-$pkgver{,-py2}
}

build() {
  cd $_pkgname-$pkgver
  python setup.py build

  cd ../$_pkgname-$pkgver-py2
  python2 setup.py build
}

package_python-pychromecast() {
  depends=('python' 'python-protobuf' 'python-requests' 'python-zeroconf' 'python-six')
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/$pkgname/examples examples/*
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pychromecast() {
  depends=('python2' 'python2-protobuf' 'python2-requests' 'python2-zeroconf' 'python2-six')
  cd $_pkgname-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/$pkgname/examples examples/*
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
