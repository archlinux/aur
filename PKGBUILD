# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname='catt'
pkgver=0.12.0
pkgrel=2
pkgdesc='Cast All The Things - Send videos from many, many online sources to your Chromecast.'
arch=('any')
url=https://github.com/skorokithakis/"${pkgname}"
license=('BSD')
depends=(
  'patch'
  'python'
  'python-click'
  'python-ifaddr'
  'python-netifaces'
  'python-pychromecast>=7.5.0'
  'python-requests'
  'youtube-dl>=2020.06.06')
makedepends=('python' 'python-setuptools')
source=("${pkgname}"-"${pkgver}".tar.gz::${url}/archive/v"${pkgver}".tar.gz)
sha256sums=('d9a4cf7171d29108a232c1c5621b1ca767e4c77d86099567763a85de1f00ac80')

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
