# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname='catt'
pkgver=0.11.0
pkgrel=1
pkgdesc='Send videos from many, many online sources to your Chromecast'
arch=('any')
url=https://github.com/skorokithakis/"${pkgname}"
license=('BSD')
depends=(
  'python'
  'python-click'
  'python-ifaddr'
  'python-netifaces'
  'python-pychromecast'
  'python-requests'
  'youtube-dl>=2019.01.24')
makedepends=('python' 'python-setuptools')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/skorokithakis/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('f20c1f0b946c712b622135a1712a84831c22816c0c915aa990ad5168d8cea364')

build(){
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm644 README.rst "${pkgdir}"/usr/share/doc/"${pkgname}"/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
