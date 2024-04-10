# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pook
pkgver=1.2.1
pkgrel=2
pkgdesc="Versatile and expressive HTTP traffic mocking and testing made simple in Python"
url="https://github.com/h2non/pook"
license=('MIT')
arch=('any')
depends=('python-furl' 'python-jsonschema' 'python-xmltodict')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose' 'python-pytest' 'python-aiohttp' 'python-requests')
source=("https://github.com/h2non/pook/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5053703bebe5be6d01d9cddb4333d2b02de348781088b17f92db97eb70eee8fc77b2ed88d80374d7774464776e99f8a0c587f36c68146b56c91442e699dc7d46')

build() {
  cd pook-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pook-$pkgver
  pytest
}

package() {
  cd pook-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # It's only present when tests are enabled, so adding -f
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir"/$site_packages/tests
}
