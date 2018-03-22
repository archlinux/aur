# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Maitnainer: Morten Linderud <morten@linderud.pw>

pkgbase=python-pychromecast
pkgname=('python-pychromecast' 'python2-pychromecast')
_pkgname=pychromecast
pkgver=2.1.0
pkgrel=1
pkgdesc='Library for Python 2 and 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d532bfe50118c647a69f26c7dffe25dc30ede80253f7eb6d33f67ba5bddaf189608285559a5d3be80110300ca7b217ae384b1ad323a0241bc7756903939e2c0f')

prepare() {
  cp -a $_pkgname-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build

  cd "$srcdir/$_pkgname-$pkgver-py2"
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
