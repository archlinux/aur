# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python2-cabocha
_pkgname=cabocha
pkgver=0.69
pkgrel=2
pkgdesc="Yet Another Japanese Dependency Structure Analyzer (Python2 interface)"
url="https://taku910.github.io/cabocha/"
arch=('x86_64' 'i686')
license=('LGPL2.1' 'BSD')
depends=('crfpp' 'mecab' 'cabocha' 'python')
source=("${pkgname}-${pkgver}.tar.bz2::https://googledrive.com/host/0B4y35FiV1wh7cGRCUUJHVTNJRnM/cabocha-0.69.tar.bz2"
        "setup.patch")
sha1sums=('9196098628c5d1f0b83b371a03352b6652c04001'
          'b2d920fb3eec220339dcc71e964523cd2eab0ac9')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}/python
  patch < ${srcdir}/setup.patch
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/python
  python2 setup.py build_ext
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/python

  python2 setup.py install --root=${pkgdir}
  install -Dm644 ../COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
