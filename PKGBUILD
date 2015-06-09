# Maintainer : Hoàng Đức Hiếu <arch@zahe.me>
# Contributor: Fernando
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgname=diffpdf
pkgver=2.1.3
pkgrel=1
pkgdesc="Diffing pdf files visually or textually"
url="http://www.qtrac.eu/diffpdf.html"
screenshot="http://www.qtrac.eu/diffpdf.png"
license=('GPL')
arch=('i686' 'x86_64')
depends=('poppler-qt')
source=("http://www.qtrac.eu/${pkgname}-${pkgver}.tar.gz"
        "diffpdf.desktop")
sha1sums=('663ecb7666a4b7d6fbd1a37327fd1f895fae69b8'
         '6d504eb302026d4d157ed9eca8c38d824ca302de')

build () {
  cd ${srcdir}/${pkgname}-${pkgver}
  [ -e "*.qm" ] && make clean
  lrelease-qt4 ${pkgname}.pro
  qmake-qt4
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  install -Dpm755 -D diffpdf ${pkgdir}/usr/bin/diffpdf
  install -Dpm644 -D diffpdf.1 ${pkgdir}/usr/share/man/man1/diffpdf.1

  _docdir=${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  _licdir=${pkgdir}/usr/share/licenses/${pkgname}
  _pngdir=${pkgdir}/usr/share/pixmaps
  _appdir=${pkgdir}/usr/share/applications
  install -dpm755 ${_docdir} ${_licdir} ${_pngdir} ${_appdir}
  install -Dpm644 CHANGES README help.html ${_docdir}/
  install -Dpm644 gpl-2.0.txt ${_licdir}/
  install -Dpm644 images/icon.png ${_pngdir}/${pkgname}.png
  install -Dpm644 ../../diffpdf.desktop ${_appdir}/
}
