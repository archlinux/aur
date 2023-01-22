# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pook
pkgver=1.1.1
pkgrel=1
pkgdesc="Versatile and expressive HTTP traffic mocking and testing made simple in Python"
url="https://github.com/h2non/pook"
license=('MIT')
arch=('any')
depends=('python-furl' 'python-jsonschema' 'python-xmltodict')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-pytest' 'python-aiohttp' 'python-requests')
source=("https://github.com/h2non/pook/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d9764f322475cb544498c3a2efb830790f058147903298e354ee02f2c14b7f1f3f8f227bf03de09ba09476ab2230d3a4064a944ada1aa327d1dba907b21dc505')

build() {
  cd pook-$pkgver
  python setup.py build
}

check() {
  cd pook-$pkgver
  pytest
}

package() {
  cd pook-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # It's only present when tests are enabled, so adding -f
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir"/$site_packages/tests
}
