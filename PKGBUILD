# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Maitnainer: Morten Linderud <morten@linderud.pw>

pkgbase=python-pychromecast
_pkgname=pychromecast
pkgname=('python-pychromecast' 'python2-pychromecast')
pkgver=0.8.2
pkgrel=2
pkgdesc='Library for Python 2 and 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('72442b2a3d9742587a9f7b11b3f502a8929c07b34332dc5197b75a0da0cd8f96fb896c044454fb77c8deaaebc00891070a7c5d27568696d69252c7e4139627fb')

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
  depends=('python' 'python-protobuf' 'python-requests' 'python-zeroconf')
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/$pkgname/examples examples/*
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pychromecast() {
  depends=('python2' 'python2-protobuf' 'python2-requests' 'python2-zeroconf')
  cd $_pkgname-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/$pkgname/examples examples/*
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
