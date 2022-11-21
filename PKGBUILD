# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-nest-asyncio
pkgver=1.5.6
pkgrel=1
pkgdesc="Patch asyncio to allow nested event loops"
url="https://github.com/erdewit/nest_asyncio"
license=('BSD')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
provides=('python38-nest_asyncio')
replaces=('python38-nest_asyncio')
source=("https://github.com/erdewit/nest_asyncio/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3dbfe5362a31dcd3e579e30164a51d9cd8dcb5507667fa454a6375bbd0a1cca209df01cf99424e8e424685d617c0524888784f3672c8e9454de4cea07daeca03')

build() {
  cd nest_asyncio-$pkgver
  python3.8 setup.py build
}

check() {
  cd nest_asyncio-$pkgver
  PYTHONPATH="$PWD/build/lib" python3.8 tests/nest_test.py
}

package() {
  cd nest_asyncio-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
