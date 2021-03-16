# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=thumbor
pkgver=7.0.0a5
pkgrel=1
pkgdesc="open-source photo thumbnail service"
arch=('x86_64')
url="https://github.com/thumbor/thumbor"
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
backup=("etc/thumbor.conf")
source=("https://github.com/thumbor/thumbor/archive/$pkgver.tar.gz")
b2sums=('be18d4cda7cfb759a4a928bb6e63f2b8126a379a81c9902dd3e8e243e0418bb294a684664c636ffdc86a96366976ed5510a084e44e643581874da1f085a219cc')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 $pkgname/$pkgname.conf -t "${pkgdir}"/etc/
}
