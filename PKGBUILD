# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-autocommand
pkgver=2.2.1
pkgrel=1
pkgdesc="A library to create a command-line program from a function"
url="https://github.com/Lucretiel/autocommand"
license=('LGPL')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://github.com/Lucretiel/autocommand/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        https://github.com/Lucretiel/autocommand/commit/031c9750c74e3313b954b09e3027aaa6595649bb.patch)
sha512sums=('6ab6b7f712c9e57cefb25299e2f98359bb39fd55439fc40a5c9ed752ff54f664c9badf044418576c0dc47b1b76114d96946b2df5343b27eeb87eb24213a33a26'
            '3535f6f62cb2803a218d92b0d5c77895633afaae0b17e2d82cb15b5d7fdad84afa95f91a2c3a739fb61620abdd25851064f84e1351793e4ea1e4e67f03c58ff0')

prepare() {
  cd autocommand-$pkgver
  # https://github.com/Lucretiel/autocommand/issues/20
  patch -p1 -i ../031c9750c74e3313b954b09e3027aaa6595649bb.patch
}

build() {
  cd autocommand-$pkgver
  python3.8 setup.py build
}

check() {
  cd autocommand-$pkgver
  PYTHONPATH="$PWD"/build/lib pytest
}

package() {
  cd autocommand-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
