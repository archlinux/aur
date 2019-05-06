# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-storage
pkgname=python-$_name
pkgver=1.5.0
pkgrel=1
pkgdesc="Microsoft Azure Storage Library for Python"
arch=('any')
url="https://github.com/Azure/azure-storage-python"
license=('Apache')
makedepends=('python-setuptools')
source=("https://github.com/Azure/azure-storage-python/archive/v${pkgver}-blob.tar.gz")
sha256sums=('baf03a10b3ecebe2119947fc664f346e0c5ebceba40e091939e43d7d94ed1c08')

_packages=('azure-storage-common' 'azure-storage-blob'
           'azure-storage-file' 'azure-storage-queue')

build() {
  cd "${_name}-python-${pkgver}-blob"

  for package in ${_packages[@]}; do
    cd "${package}"
    python setup.py build
    cd ..
  done
}

package() {
  cd "${_name}-python-${pkgver}-blob"

  for package in ${_packages[@]}; do
    cd "${package}"
    python setup.py install --root="${pkgdir}" --optimize=1
    cd ..
  done
}

