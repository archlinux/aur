# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Florian Pritz <bluewind@xinu.at>

# Based on python-schema in [community]

_name=schema
pkgname=python2-$_name
pkgver=0.7.4
pkgrel=1
pkgdesc='Python module to validate and convert data structures.'
arch=('any')
url="https://github.com/keleshev/$_name"
depends=('python2' 'python2-contextlib2')
makedepends=('python2-setuptools')
checkdepends=('python2-mock' 'python2-pytest')
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fbb6a52eb2d9facf292f233adcc6008cffd94343c63ccac9a1cb1f3e6de1db17')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_name-$pkgver"

  python2 setup.py test
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
