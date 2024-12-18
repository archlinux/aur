# Maintainer: Mark Weiman <mark.weiman@markzz.com>

pkgbase=python-pybgpstream
pkgname=('python-pybgpstream')
_pkgname='pybgpstream'
pkgver=2.0.4
pkgrel=1
pkgdesc="python bindings for libbgpstream"
arch=('x86_64')
license=('GPL')
url="https://bgpstream.caida.org/"
depends=('bgpstream>=2.0.0')
makedepends=('python' 'python-setuptools')
source=("https://github.com/CAIDA/pybgpstream/releases/download/v${pkgver}/pybgpstream-${pkgver}.tar.gz")
md5sums=('c35825f31e720306f831c5e23855b96d')

prepare() {
  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}2-${pkgver}"

  find "${srcdir}/${_pkgname}2-${pkgver}" -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package_python-pybgpstream() {
  depends=('python' 'bgpstream')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
