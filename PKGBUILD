# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-alt-pytest-asyncio
pkgver=0.8.0
pkgrel=1
pkgdesc='Alternative pytest plugin to pytest-asyncio'
arch=('any')
license=('MIT')
url='https://github.com/delfick/alt-pytest-asyncio'
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-noseofyeti' 'python-nest-asyncio' 'python-pytest-order')
source=("git+https://github.com/delfick/alt-pytest-asyncio.git#tag=release-$pkgver")
sha512sums=('617d80fd1eaa2a007bda61ced02345ad33d1ba065f81122a8d12241f5de487ad5e9f7a3831fc282fa2303f5101adc81e7190e21e8d36590eac435fc166bdcee3')

build() {
  cd alt-pytest-asyncio
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd alt-pytest-asyncio
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd alt-pytest-asyncio
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
