# Maintainer: Graham R King <grking dot email at gmail dot com>
pkgname=xxcmd
pkgver=0.9.0
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
sha256sums=('ece38ed8b09d82228f046919bf03943c41bc41e8f6bdbfdcc021e7c777f585b9')
b2sums=('fbbf72b78b7be6667dcff165308c178441786f090888d4f442f9e522cd50624dc25f939964c6af8e4182d7bf645f23edb9c683ae74b2f2b5e361372ef08a54e9')

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
