# Maintainer: Mark Weiman <mark.weiman@markzz.com>

pkgbase=python-pybgpstream
pkgname=('python-pybgpstream' 'python2-pybgpstream')
_pkgname='pybgpstream'
pkgver=2.0.2
pkgrel=1
pkgdesc="python bindings for libbgpstream"
arch=('x86_64')
license=('GPL')
url="https://bgpstream.caida.org/"
depends=('bgpstream>=2.0.0')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://github.com/CAIDA/pybgpstream/releases/download/v${pkgver}/pybgpstream-${pkgver}.tar.gz")
md5sums=('6ede4beba331bf0a433c1ebb142d53c9')

prepare() {
  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}2-${pkgver}"

  find "${srcdir}/${_pkgname}2-${pkgver}" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}2-${pkgver}"
  python2 setup.py build
}

package_python-pybgpstream() {
  depends=('python' 'bgpstream')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pybgpstream() {
  depends=('python2' 'bgpstream')
  cd "${srcdir}/${_pkgname}2-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
