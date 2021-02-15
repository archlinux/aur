# Maintainer: Graham R King <grking dot email at gmail dot com>
pkgname=xxcmd
pkgver=0.10.1
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
sha256sums=('6691b8e328a2b55f8f3308043cc1b3e7cb8f184ee63ce1096add1fe10a8844a8')
b2sums=('82a72510cb5fd8edd8199462a0dce4986e529b2aaa1a479356b491f93a8d3fa0c80f8d226831af197178bbacf1ec0487ef893bbbde0c406d619cf37a02d2875e')

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
