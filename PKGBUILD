# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=python-pyqt-qwt
_pkgname=PyQt-Qwt
pkgver=1.02.02
pkgrel=2
pkgdesc="Python PyQt wrapper for Qwt 6"
arch=('x86_64')
url="https://github.com/GauiStori/PyQt-Qwt"
license=('LGPL'
         'custom:qwt')
depends=('python'
		 'python-pyqt5'
		 'qwt>=6.1.4')
optdepends=('python-numpy: required for some of the provided Qt 5 examples')
makedepends=('pyqt-builder'
			 'sip>=4.18')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GauiStori/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('aac4730ab28f2b7af661775672e32129615ca0e7909a555f297c5f1f2fbc750c')

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
