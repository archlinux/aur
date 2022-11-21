# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pyjsparser
pkgver=2.7.1
_commit=5465d037b30e334cb0997f2315ec1e451b8ad4c1
pkgrel=9
pkgdesc="Fast javascript parser (based on esprima.js)"
url="https://github.com/PiotrDabkowski/pyjsparser"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-js2py' 'python38-pytest')
source=("$pkgname-$_commit.tar.gz::https://github.com/PiotrDabkowski/pyjsparser/archive/$_commit.tar.gz")
sha512sums=('2e4b3ee1cd863099da262eaf4df5ec4f364ce54e7c7535558f36d3449e21c9f851460078e1a7057ef8c82e2ed9c82f54944cd92782fe3f8cd05411edca191a40')

prepare() {
  mv pyjsparser-{$_commit,$pkgver}
}

build() {
  cd pyjsparser-$pkgver
  python3.8 setup.py build
}

check() {
  cd pyjsparser-$pkgver
  pytest
}

package_python38-pyjsparser() {
  cd pyjsparser-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
