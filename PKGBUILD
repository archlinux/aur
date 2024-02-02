# Maintainer: Felix Yan <felixonmars@archlinux.org>

_name=setuptools_scm
pkgname=python2-setuptools-scm
pkgver=5.0.2
pkgrel=2
pkgdesc="The blessed package to manage your versions by scm tags"
arch=('any')
license=('MIT')
url="https://github.com/pypa/setuptools_scm"
depends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-packaging' 'python2-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('83a0cedd3449e3946307811a4c7b9d89c4b5fd464a2fb5eeccd0a5bb158ae5c8')

build() {
  cd $_name-$pkgver
  python2 setup.py build
}

package() {
  cd $_name-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

check() {
  cd $_name-$pkgver
  PYTHONPATH="$(pwd)/build/lib" python2 -m pytest
}
