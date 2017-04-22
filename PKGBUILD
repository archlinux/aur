pkgbase=python-rust-ext-git
pkgname=('python-rust-ext-git' 'python2-rust-ext-git')
pkgver=0.1.1.32
pkgrel=1
pkgdesc="Distutils helpers for rust Python extensions"
arch=('any')
license=('MIT')
url="https://github.com/novocaine/rust-python-ext"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=()
source=("rust-ext::git+https://github.com/novocaine/rust-python-ext.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir"/rust-ext
	echo "$(python -c "print(\"$(python setup.py --version)\".split('-')[0])").$(git rev-list --count HEAD)"
}

package_python-rust-ext-git() {
  depends=('python' 'cargo')
  provides=('python-rust-ext')
  conflicts=('python-rust-ext')

  cd rust-ext
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/python-rust-ext/LICENSE
}

package_python2-rust-ext-git() {
  depends=('python2' 'cargo')
  provides=('python2-rust-ext')
  conflicts=('python2-rust-ext')

  cd rust-ext
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/python2-rust-ext/LICENSE
}
