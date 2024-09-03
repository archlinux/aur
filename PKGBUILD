# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-alt-pytest-asyncio
pkgver=0.8.1
pkgrel=1
pkgdesc='Alternative pytest plugin to pytest-asyncio'
arch=('any')
license=('MIT')
url='https://github.com/delfick/alt-pytest-asyncio'
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-noseofyeti' 'python-nest-asyncio' 'python-pytest-order')
source=("git+https://github.com/delfick/alt-pytest-asyncio.git#tag=release-$pkgver")
sha512sums=('a57ffd4d63f033e16de4192a84d818f673b3d30bbf105950873e75e5f814f321ebe070c3387e65f42ba31ad5d881783a0ac651833136d83e06ed41291e8449cd')

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
