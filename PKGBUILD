# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-znp
pkgname=python-$_pkgname
pkgver=0.12.3
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
b2sums=('18cb1b43a04fc5515250c5b0c20104f45568eda3147f2b1f119d79d0cd05ebc97fe61717bec0377be1aec9d80024f384874bdaf0dc9fcae28c3723e49bb7b7f4')

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
