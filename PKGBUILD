# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-znp
pkgname=python-$_pkgname
pkgver=0.12.1
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
  'python-installer'
  'python-setuptools-git-versioning'
)
checkdepends=('python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy-znp/archive/v$pkgver.tar.gz")
b2sums=('b81aff9f06c71feab7306a92ead2279028dc6a08550a630703a076f9e26f0dbfbd95c47c6c26aed058a91f059d388d8ddf15ebef68f85cbef5d835281520face')

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
