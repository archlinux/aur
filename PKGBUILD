# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_gituser=pycontribs
_pkgname=jenkinsapi

pkgbase=python-${_pkgname}
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.3.5
pkgrel=1
pkgdesc="A Python API for accessing resources on a Jenkins continuous-integration server."
arch=('any')
url="https://github.com/${_gituser}/${_pkgname}"
license=('MIT')
makedepends=("python-setuptools" "python2-setuptools")
source=("https://github.com/${_gituser}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('710131ac145505426b4d5e33428d96845620f95082d21597cf6063da2cb54eaa')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-python2}
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-python2"
  python2 setup.py build
}

package_python-jenkinsapi() {
  depends=("python" "python-requests" "python-pytz")

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-jenkinsapi() {
  depends=("python2" "python2-requests" "python2-pytz")

  cd "${srcdir}/${_pkgname}-${pkgver}-python2"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set sw=2 sts=2 ft=sh et:
