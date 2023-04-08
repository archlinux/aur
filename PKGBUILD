# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-geocoder
pkgver=1.38.1
pkgrel=5
pkgdesc="A simple and consistent geocoding library"
url="https://github.com/DenisCarriere/geocoder"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-ratelim' 'python-click' 'python-six' 'python-future')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-requests-mock')
source=("https://pypi.io/packages/source/g/geocoder/geocoder-$pkgver.tar.gz")
sha512sums=('e6308b3a918fe2d61bbaa3ad0b0aa2039757a78146acb497fd98e57d4315541dd56a76b482d22823b314e8a093ab8b6759d7aadb6a9c8ab3ee39473e36b218cb')

build() {
  cd geocoder-$pkgver
  python setup.py build
}

check() {
  cd geocoder-$pkgver
  python setup.py pytest || echo "Some tests require API key"
}

package() {
  cd geocoder-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
