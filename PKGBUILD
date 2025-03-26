# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-znp
pkgname=python-$_pkgname
pkgver=0.14.0
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
b2sums=('9da83cad4d2c82843fe5794f8fb12fcd95cc53b43d5c3a076c55cabcd91868135fab4cf0e178d6696b9912f07cd984a0172277f6f9d095f18be8de17fabed145')

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
