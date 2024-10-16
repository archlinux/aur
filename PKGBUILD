# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-znp
pkgname=python-$_pkgname
pkgver=0.13.0
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
b2sums=('d54624ad0e4376a76471054e901f59647d6cbadfc091c59c73e97c698af5f16af647dec365194f60e40cd38f8e8af2f39a0281998b60c246e4e00698ce8cae56')

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
