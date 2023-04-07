# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-yg.lockfile
pkgver=2.3
_commit=b5755e50ba78c7e5ba90bc1679d75bba6e74d754
pkgrel=6
pkgdesc="Lockfile object with timeouts and context manager"
url="https://github.com/yougov/yg.lockfile"
license=('MIT')
arch=('any')
depends=('python-zc.lockfile' 'python-tempora' 'python-jaraco.functools')
makedepends=('git' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/yougov/yg.lockfile.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd yg.lockfile
  # License file, ignore changes to README which introduces a conflict
  git show 5dc924c102a23d06cafd8e0850f0f35582cbd9aa -- LICENSE | git apply -
}

build() {
  cd yg.lockfile
  python setup.py build
}

check() {
  cd yg.lockfile
  python -m pytest
}

package() {
  cd yg.lockfile
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
