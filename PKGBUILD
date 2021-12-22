# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=python-pyqt-qwt
_pkgname=PyQt-Qwt
_commit=d98d49904765c03c11c400b9d7fc4e52a2418cdd
pkgver=1.02.02.20210915
pkgrel=1
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
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GauiStori/${_pkgname}/archive/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/piannucci/${_pkgname}/archive/${_commit}.tar.gz")
sha256sums=('4dd561a7eb3458ce869f3f5a8bda198ca3ddd06a1c6889d795fc3d20f5f5a161')

prepare() {
  mv "${_pkgname}-d98d49904765c03c11c400b9d7fc4e52a2418cdd" "${_pkgname}-${pkgver}"
}

build() {
  cd "${_pkgname}-${pkgver}"
  sip-build --verbose \
    --qwt-incdir=/usr/include/qwt \
    --qwt-libdir=/usr/lib \
    --qwt-lib=qwt
}

package() {
  cd "${_pkgname}-${pkgver}/build"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
