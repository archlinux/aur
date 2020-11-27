# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# Based on python-responses in [community]

_name=responses
pkgname=python2-$_name
pkgver=0.12.1
pkgrel=1
pkgdesc='A utility library for mocking out the `requests` Python library.'
arch=('any')
license=('Apache')
url="https://github.com/getsentry/$_name"
depends=('python2' 'python2-requests' 'python2-cookies' 'python2-six' 'python2-mock')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner' 'python2-pytest-cov' 'python2-flake8' 'python2-pytest-localserver')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f99e9a127328bd000c78d160fdd0cf8288999c47c933b185e9cce323697f2728ec28dc6dd8a4e29b55797e7fff94076190165bc63e1bc36e050027f875d95775')

prepare() {
  cd $_name-$pkgver

  sed -i 's/, < 5.0.0//' setup.py
}

build() {
  cd $_name-$pkgver

  python2 setup.py build
}

check() {
  cd $_name-$pkgver

  python2 setup.py pytest
}

package() {
  cd $_name-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
