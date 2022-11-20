# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-hyperlink
pkgver=21.0.0
pkgrel=4
pkgdesc='A featureful, correct URL for Python'
arch=('any')
license=('BSD')
url='https://github.com/python-hyper/hyperlink'
depends=('python38-idna')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("https://github.com/python-hyper/hyperlink/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fa6c9da0e414319bf20be66dc5593b3fe2e8772c62d36adf2de32c277e49469ada952ca591f41fae8d2229812d79f1e6b7eaa23e63995c7f02ce10aa5569cd61')

build() {
  cd hyperlink-$pkgver
  python3.8 setup.py build
}

check() {
  cd hyperlink-$pkgver
  python3.8 setup.py pytest

  # clean-up non-reproducible files generated during test
  rm -rf hyperlink/test/__pycache__/
}

package() {
  cd hyperlink-$pkgver

  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
