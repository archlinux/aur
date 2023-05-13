# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=python-pyqt-qwt
_pkgname=PyQt-Qwt
_commit=d98d49904765c03c11c400b9d7fc4e52a2418cdd
pkgver=1.02.02.20210915
pkgrel=3
pkgdesc="Python PyQt wrapper for Qwt 6"
arch=('x86_64')
url="https://github.com/GauiStori/${_pkgname}"
license=('LGPL'
         'custom:qwt')
depends=('python'
         'python-pyqt5'
         'qwt>=6.1.4')
optdepends=('python-numpy: required for some of the provided Qt 5 examples')
makedepends=('pyqt-builder'
             'sip>=4.18')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/piannucci/${_pkgname}/archive/${_commit}.tar.gz")
sha512sums=('042e75397f43d82d41ce20274086d270fc3f5952be9742b1f77e85fab33fff28e241d870ed6cfb84671b1350eb6765a451979cef0d3f8c31e4b1e5c9d55fa17c')

prepare() {
  mv "${_pkgname}-${_commit}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  sip-build --verbose \
    --qwt-incdir=/usr/include/qwt \
    --qwt-libdir=/usr/lib \
    --qwt-lib=qwt
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
