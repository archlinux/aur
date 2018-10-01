# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgbase=python-peakutils
pkgname=('python-peakutils' 'python2-peakutils')
pkgver=1.3.0
pkgrel=1
pkgdesc="Peak detection utilities for 1D data"
arch=('any')
url="https://pypi.python.org/pypi/PeakUtils"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/cf/07/7bd0f10c2f35884fdb04affdb3c137a955d68c3840da86c896f4dcc9b6ee/PeakUtils-${pkgver}.tar.gz")
md5sums=('a1a142f9a01fd88d89d7b6ab9879b355')
sha256sums=('ae3da09fb16ffd9dcedd7428d326008ab0f0e21cccf681e2a41e05ee10ac72f4')

prepare() {
  cd "${srcdir}"

  cp -a "PeakUtils-${pkgver}" "${pkgname[0]}"
  cp -a "PeakUtils-${pkgver}" "${pkgname[1]}"
}

build() {
  cd "${srcdir}/${pkgname[0]}"
  python setup.py build

  cd "${srcdir}/${pkgname[1]}"
  python2 setup.py build
}

package_python-peakutils() {
  depends=('python-numpy' 'python-scipy')

  cd "${srcdir}/${pkgname[0]}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-peakutils() {
  depends=('python2-numpy' 'python2-scipy')

  cd "${srcdir}/${pkgname[1]}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

