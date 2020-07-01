# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname='catt'
pkgver=0.11.2
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
sha256sums=('e9cdce0fb1992b3d09535cee25f557413bc5d70fb5b5e952ce660ea914933294')

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
