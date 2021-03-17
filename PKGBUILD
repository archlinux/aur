# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=21.3.2
pkgrel=1
pkgdesc='Plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs' 'python-setuptools')
checkdepends=('python-hypothesmith')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f7fd40785259055a391698d34931df1961633b75835379f453bc0102c243becd9472116af43da7f317506b7436bbbd90e38e2d8750420fb482b9d8e24399972e')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  python -m tests.test_bugbear
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
