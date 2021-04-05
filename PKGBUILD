# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# Based on python-responses in [community]

_name=responses
pkgname=python2-$_name
pkgver=0.13.2
pkgrel=1
pkgdesc='A utility library for mocking out the `requests` Python library.'
arch=('any')
license=('Apache')
url="https://github.com/getsentry/$_name"
depends=('python2' 'python2-requests' 'python2-cookies' 'python2-six' 'python2-mock')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner' 'python2-pytest-cov' 'python2-flake8' 'python2-pytest-localserver')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ef6e9cd455ae68711a648034eead4dc224dc8935cc8c525d8299a6fd19880944774e68bd457e83343b6d00ffcf4e9a6d9f261c5a8cf72c3934e35c817a3b0019')

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
