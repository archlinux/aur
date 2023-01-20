# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-spec
pkgver=1.4.1
pkgrel=3
pkgdesc="Specification-style nosetests output for Python"
url="https://github.com/bitprophet/spec"
license=('MIT')
arch=('any')
depends=('python-nose' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/bitprophet/spec/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('da512a30106e324a7ce5a3a6b3b587d95a7f8b2bb584b069b28e5dca3369c5f9b7527154ac354e06c17489e70faaa72aa2350e3d51101547713d1efa97221e66')

build() {
  cd spec-$pkgver
  python setup.py build
}

check() {
  cd spec-$pkgver
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PATH="$PWD/tmp_install/usr/bin" PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages:$PYTHONPATH" spec --help
}

package() {
  cd spec-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
