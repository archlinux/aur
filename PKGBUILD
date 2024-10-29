# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-znp
pkgname=python-$_pkgname
pkgver=0.13.1
pkgrel=1
pkgdesc='Zigpy support for common Texas Instruments ZNP radio modules'
url='https://github.com/zigpy/zigpy-znp'
arch=('any')
license=('GPL3')
depends=(
  'python'
  'python-zigpy'
  'python-voluptuous'
  'python-coloredlogs'
  'python-jsonschema'
  'python-pyserial-asyncio'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools-git-versioning'
)
checkdepends=('python-pytest-asyncio' 'python-pytest-mock')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy-znp/archive/v$pkgver.tar.gz")
b2sums=('1091645c3a3debc22c64e0e5ec10d1adc9a9da469d57ccaac944238a2ee8c9b89c37c9a221277d481a13e20e08d0623f5bd253fee35d774b030a3eaafc66761d')

prepare() {
  cd $_pkgname-$pkgver
  #no real reason for <2 / see https://github.com/zigpy/zigpy-znp/issues/247
  sed -i 's/<2//g' pyproject.toml
}


build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  pytest
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
