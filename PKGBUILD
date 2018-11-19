# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='catt'
pkgver=0.8.1
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
sha256sums=('e153abbc21dcc6039e41b189f4a20314a30c144382200711b3738d064b212e94')

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
