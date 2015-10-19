# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python-pbkdf2
_pkgname=pbkdf2
pkgver=1.3
pkgrel=1
pkgdesc="A module that implements the password-based key derivation function PBKDF2."
arch=('any')
url="https://www.dlitz.net/software/python-pbkdf2/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-crypto: to make use of PyCrypto`s HMAC and SHA')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz"
        LICENSE)
md5sums=('40cda566f61420490206597243dd869f'
         '180c44cc3999239185d0523570c61fa8')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  touch test/__init__.py
  find . -type f -name "*.py" -exec sed -i 's#/usr/bin/python.+#/usr/bin/python#g' {} +
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m unittest test.test_pbkdf2
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
