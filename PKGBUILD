# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-green
pkgver=4.0.2
pkgrel=1
pkgdesc="Green is a clean, colorful, fast python test runner"
url="https://github.com/CleanCut/green"
license=('MIT')
arch=('any')
depends=('python-colorama' 'python-coverage' 'python-lxml' 'python-setuptools' 'python-unidecode')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-django' 'python-testtools')
source=("git+https://github.com/CleanCut/green.git#tag=$pkgver")
sha512sums=('8b66dc9cca2d8279f06a92a3727626aa89bd34fd3385fc1c094bd62514d0f13815ff1c7339db9336e0c5d618bf005a20b6d9299205a16238bd9ad84a37cc6ff1')

build() {
  cd green
  python -m build -nw
}

check() {
  cd green
  ./g 3 -r -vvvv green
}

package() {
  cd green
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
