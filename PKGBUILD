# Maintainer: Graham R King <grking dot email at gmail dot com>
pkgname=xxcmd
pkgver=0.8.0
pkgrel=1
pkgdesc="A helper for remembering useful shell commands."
arch=('any')
url=https://github.com/grking/xxcmd
license=('MIT')
depends=("python")
makedepends=('python-setuptools' 'python-pytest')
provides=("$pkgname")
replaces=("$pkgname")
changelog=''
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b53fd4d5dd14b48698b8764c6fea7d18d0f807cc7ef6a29777112c08c8aa125b')
b2sums=('11e227c8c60b6b839cba2dca7ec98d4c7e2195b82ecb3452aecde9a9e64be356d3ac2bebee807141f0aec4117a10808e265184e686910d6c0439ed2f9d1b21e7')

check() {
    cd "$srcdir/$pkgname-$pkgver"
    pytest -q
}

build() {
  cd $pkgname-$pkgver
  python -m setuptools.launch setup.py build
}

package() {
  cd $pkgname-$pkgver
  python -m setuptools.launch setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mkdir -p "$pkgdir"/usr/share/man/man1
  cp docs/xx.1 "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  cp LICENSE "$pkgdir"/usr/share/licenses/$pkgname
  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  cp CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname
  cp README.md "$pkgdir"/usr/share/doc/$pkgname
}
