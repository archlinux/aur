# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Igor Nemilentsev <trezorg@gmail.com>
# Contributor: Alexander Diana <alexander@rouk.org>

pkgname=python38-bcrypt
pkgver=4.0.1
pkgrel=1
pkgdesc="Modern password hashing for your software and your servers"
arch=('x86_64')
url="https://github.com/pyca/bcrypt"
license=('Apache')
depends=('python38')
makedepends=('python38-setuptools-rust')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyca/bcrypt/archive/$pkgver.tar.gz")
sha512sums=('eb7b1d67a2d60e82e2d2e4dcb12d7808be910f9b7aefab714a22dedbffc3722182875fdcf3c8c650c0bb7c1122e9e8bead92f18bc660043b017a14957467e2a9')

build() {
  cd bcrypt-$pkgver
  python3.8 setup.py build
}

check() {
  cd bcrypt-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-38" pytest
}

package() {
  cd bcrypt-$pkgver
  python3.8 setup.py install --prefix=/usr --root="$pkgdir"
}
