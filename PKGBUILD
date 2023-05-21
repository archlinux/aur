# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-alt-pytest-asyncio
pkgver=0.7.0
pkgrel=1
pkgdesc='Alternative pytest plugin to pytest-asyncio'
arch=('any')
license=('MIT')
url='https://github.com/delfick/alt-pytest-asyncio'
depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-noseofyeti' 'python-nest-asyncio')
source=("https://github.com/delfick/alt-pytest-asyncio/archive/release-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5e35f444ffa1cfbc00a74784f2bb01d4f9ca0852a88e9561afcbba79752575c9c1660d1f189799ab17fd1a31afcf20f590683149c5439c07299d8c3e6e6949d0')

build() {
  cd alt-pytest-asyncio-release-$pkgver
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd alt-pytest-asyncio-release-$pkgver
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd alt-pytest-asyncio-release-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
