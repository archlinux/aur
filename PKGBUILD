# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: dnuux <dnuuxx@gmail.com>

pkgname=python38-faker
pkgver=12.1.0
pkgrel=1
pkgdesc='Faker generates fake data for you.'
arch=('any')
url='https://faker.readthedocs.io/en/master/'
license=('MIT')
provides=("python38-fake-factory=$pkgver")
conflicts=('python38-fake-factory')
replaces=('python38-fake-factory')
depends=('python38-dateutil')
makedepends=('python38-setuptools' 'python38-pytest')
checkdepends=('python38-validators' 'python38-ukpostcodeparser' 'python38-random2'
              'python38-freezegun' 'python38-pillow')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joke2k/faker/archive/v$pkgver.tar.gz")
sha512sums=('2624b1eec6b90a664dbed095950eb6a669e51279a66d690fc0de87b050bb82f0874e5cb47b9a1d120b5cea9206a82a237abdcc4cd31a7cd91411af716eebf9f6')

prepare() {
  sed -i -e 's/==/>=/' faker-$pkgver/setup.py
}

build() {
  cd faker-$pkgver
  python3.8 setup.py build
}

check() {
  cd faker-$pkgver
  python3.8 setup.py egg_info
  python3.8 -m pytest
}

package() {
  cd faker-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.txt
}
