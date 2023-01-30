# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Adam Reichold <adam.reichold@t-online.de>
pkgname=qpdfview
pkgver=0.5.0
pkgrel=1
pkgdesc="A tabbed PDF viewer using the poppler library"
url="https://launchpad.net/${pkgname}"
arch=(x86_64)
license=(GPL2)
depends=('libcups' 'libsynctex' 'poppler-qt5' 'qt5-svg')
makedepends=('qt5-tools' 'libspectre' 'djvulibre')
optdepends=('libspectre: for PostScript support'
  'djvulibre: for DjVu support')
source=(${url}/trunk/${pkgver}/+download/${pkgname}-${pkgver::-2}.tar.gz{,.asc})
sha512sums=('1b6b479bb42f4568c21b5f6cb0c552c4323739ba9fe46cea80cc199f48b0b49a278e0a2fb0d21f83bafb467e43dd37352b99ef41795d140220bb82d704e03926'
  'SKIP')
validpgpkeys=('1F521FF0F87E9E1CDE46B8A9F4928C4DD24D4DF8') # Adam Reichold <adam.reichold@t-online.de>

build() {
  cd ${pkgname}-${pkgver::-2}
  lrelease-qt5 qpdfview.pro
  qmake-qt5 qpdfview.pro
  make
}

package() {
  cd ${pkgname}-${pkgver::-2}
  make INSTALL_ROOT="$pkgdir" install
}
