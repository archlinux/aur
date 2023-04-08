# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-softlayer-zeep
pkgver=5.0.0
pkgrel=2
pkgdesc="A modern/fast python SOAP client based on lxml / requests"
url="https://github.com/softlayer/softlayer-zeep"
license=('MIT')
arch=('any')
conflicts=('python-zeep')
provides=('python-zeep')
depends=('python-attrs' 'python-isodate' 'python-lxml' 'python-platformdirs' 'python-requests'
         'python-requests-toolbelt' 'python-requests-file' 'python-pytz')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-freezegun' 'python-pretend' 'python-pytest-cov'
              'python-pytest-httpx' 'python-pytest-asyncio' 'python-requests-mock')
source=("https://github.com/softlayer/softlayer-zeep/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('354126cc6f133624db953efd6cd17b6aefc64681c0f13a76afdcb8839c13f11712de86f3312130ecd1a970d3718e2a3c815e600f8e86d6d0cd77fdd4bd2ba474')

build() {
  cd softlayer-zeep-$pkgver
  python setup.py build
}

check() {
  cd softlayer-zeep-$pkgver
  PYTHONPATH="$PWD"/build/lib pytest
}

package() {
  cd softlayer-zeep-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
