# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='catt'
pkgver=0.8.0
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
  'youtube-dl')
makedepends=('python' 'python-setuptools')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/skorokithakis/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('108c290adf4bfe6143fb01c3a1014e6dea885268e15fa97688e9656abfd09716')

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
