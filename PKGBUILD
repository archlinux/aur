# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-requests-mock
pkgver=1.10.0
pkgrel=1
pkgdesc="A mock of useful classes and functions to be used with python-requests."
arch=('any')
url="https://github.com/jamielennox/requests-mock"
license=('Apache')
depends=('python38-requests' 'python38-six')
makedepends=('python38-pbr')
checkdepends=('python38-mock' 'python38-purl' 'python38-pytest' 'python38-requests-futures'
              'python38-testrepository')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamielennox/requests-mock/archive/$pkgver.tar.gz")
sha512sums=('24e34407651a14d89ce24b4fcd32556d7a522c02a3855466c6523c45e88dbc751d560478cc9af1eafc903dc8fdfc8715e1effedd116e33dee96063c980050560')

export PBR_VERSION=$pkgver

build() {
  cd requests-mock-$pkgver
  python3.8 setup.py build
}

check() {
  cd requests-mock-$pkgver
  python3.8 -m pytest tests/pytest
  python3.8 setup.py testr
}

package() {
  cd requests-mock-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
