# Maintainer: Graham R King <grking dot email at gmail dot com>
pkgname=xxcmd
pkgver=0.9.1
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
sha256sums=('d4e9d92b297e66bdfd55351a7ed8026dd9ec44d3eaed86a4c845fbccdc8c2f16')
b2sums=('7190cf3f9d3a3a0d663c470d1f088f663f7b6521af330934189153c933d47ab5ec6af06e2c96d3a5f2094f22f0fe1d137327138b7b6671f3caee9abb1a7d50bf')

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
