# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-lark-parser
pkgver=1.1.4
_nearley_commit=326831689826cb1b9a4d21d1ce0d5db9278e9636 
pkgrel=1
pkgdesc="A modern parsing library"
url="https://github.com/lark-parser/lark"
license=('MIT')
arch=('any')
depends=('python38-typing_extensions')
makedepends=('python38-setuptools')
checkdepends=('python38-js2py')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lark-parser/lark/archive/$pkgver.tar.gz"
        "nearley-$_nearley_commit.tar.gz::https://github.com/kach/nearley/archive/$_nearley_commit.tar.gz")
sha512sums=('ff6928e11fd0944842b563277f7b277b17743292f3034dc3a83bf41ee159415bf5d7e5df4231a07d63815b9ae56e201907b871cc2c5e9e43dcad0f8ee3c1b723'
            '88849bfa609c112a7687d8aba1fc140b1b6be119f7001869e7c05019e87c31874a6d0c9fb2c68b5729c4b4427ff05e36057857cea11bd51d2b5d89e7710196b7')

prepare() {
  rmdir lark-$pkgver/tests/test_nearley/nearley
  ln -s "$srcdir"/nearley-$_nearley_commit lark-$pkgver/tests/test_nearley/nearley
}

build() {
  cd lark-$pkgver
  python3.8 setup.py build
}

check() {
  cd lark-$pkgver
  python3.8 -m tests
}

package() {
  cd lark-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
