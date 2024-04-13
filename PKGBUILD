# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-alt-pytest-asyncio
pkgver=0.7.2
pkgrel=3
pkgdesc='Alternative pytest plugin to pytest-asyncio'
arch=('any')
license=('MIT')
url='https://github.com/delfick/alt-pytest-asyncio'
depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-noseofyeti' 'python-nest-asyncio')
source=("https://github.com/delfick/alt-pytest-asyncio/archive/release-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('177ddf9e4083436fa50494921488e4e6207dfbd38525da8e474a95e83afaa49c01f0769239e6b686752f2c8208e61d883adf5698b2265aa8389001f55a881b24')

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
