# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-rednose
pkgver=1.3.0
pkgrel=9
pkgdesc="Coloured output for nosetests"
url="https://github.com/JBKahn/rednose"
license=('MIT')
arch=('any')
depends=('python38-setuptools' 'python38-termstyle' 'python38-colorama' 'python38-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JBKahn/rednose/archive/$pkgver.tar.gz")
sha512sums=('15a58e659a8b5a467eed095adfdb6d1c6e7f660b37290d6ab15795888e3ba099b6c299cfc1d6caa7e9f8ba71e4260e05c87b8c72d06103ba1ff9a3a3f455c325')

prepare() {
  sed -i 's/==1.10.0//' rednose-$pkgver/setup.py
}

build() {
  cd rednose-$pkgver
  python3.8 setup.py build
}

check() {
  cd rednose-$pkgver
  python3.8 setup.py test
}

package() {
  cd rednose-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
