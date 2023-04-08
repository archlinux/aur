# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-args
pkgver=0.1.0.20170708
_commit=9460f1a35eb3055e9e4de1f0a6932e0883c72d65
pkgrel=8
pkgdesc="Command Arguments for Humans"
arch=('any')
license=('BSD')
url="https://github.com/kenneth-reitz/args"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$_commit.tar.gz::https://github.com/kenneth-reitz/args/archive/$_commit.tar.gz")
sha512sums=('acbb38e442fcc731a41d4ed5f63d33cfe7bc5cab730f99d5f9de3e9739ea4370df58798267df9c29892d93a3e2e5f4e21c54a1550c38bfc49abfc84a1e1cc438')

prepare() {
  mv args-{$_commit,$pkgver}
}

build() {
  cd args-$pkgver
  python setup.py build
}

check() {
  cd args-$pkgver
  nosetests3
}

package() {
  cd args-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
