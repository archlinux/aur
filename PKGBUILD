# Maintainer: Graham R King <grking dot email at gmail dot com>
pkgname=xxcmd
pkgver=0.10.0
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
sha256sums=('766e0b2deb80603059593259b23ece7f987b8c519dbf1f3b37a143c2568fda78')
b2sums=('ac3c04175cb96ce39dad37ab38c067d08ed989e7acb5e2f920a8d50a0746c259a8663d34b5dd9c7a5dd8ea7b9ccc051fa11e308f788a5ff49ed17346eadc50db')

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
