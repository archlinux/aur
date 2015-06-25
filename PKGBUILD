
pkgname=spectrascan
_pkgname=SpectraScan
pkgver=0008
pkgrel=1
pkgdesc="Loads images from scanned curves and exports the pixel coordinates of the curve in csv format"
arch=('i686' 'x86_64')
url="http://spectrascan.sourceforge.net/"
license=('GPL')
depends=(qt4)
makedepends=(cmake)
install=spectrascan.install
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${_pkgname}.${pkgver}.tar.bz2 spectrascan.desktop)
sha256sums=('bd32751571fa4cb3036b06ccb7ea43b50d8559d210ded3dea3e41f8502f559be')

build() {
  cd "${pkgname}"

  #DESTDIR="${pkgdir}" PREFIX="/usr" qmake-qt4 SpectraGlobal.pro
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./CMakeLists.txt

}

package() {

  cd "${pkgname}"
  # make INSTALL_ROOT="$pkgdir" install
  # NO install target

  install -d -m755 "${pkgdir}/usr/bin"

  make DESTDIR="$pkgdir/" install

  install -d -m755 "${pkgdir}/usr/share/${pkgname}"
  mv -f  "${pkgdir}"/usr/bin/* "${pkgdir}/usr/share/${pkgname}"
  rm -f -R "${pkgdir}/usr/bin"
  
  #cp -f "${_pkgname}/${_pkgname}_ru".* "${pkgdir}/usr/share/${pkgname}"
  #chmod 644 "${pkgdir}/usr/share/${pkgname}/${_pkgname}_ru"*

  cp -rf "${_pkgname}/Icons/" "${pkgdir}/usr/share/${pkgname}"
  chmod 644 "${pkgdir}/usr/share/${pkgname}/Icons/"*

  cp -rf "${_pkgname}/DocsHTML/" "${pkgdir}/usr/share/${pkgname}"
  chmod 644 "${pkgdir}/usr/share/${pkgname}/DocsHTML/english/"*

  install -d -m755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Desktop integration
  install -d -m755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/usr/share/${pkgname}/Icons/"export.svg "${pkgdir}/usr/share/pixmaps"/spectrascan.svg

  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  # install -D -m644 "$srcdir/$pkgname-mimetypes" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}

sha256sums=('d65cee089f674987a35936b78e6ac7c416192e98ca52f4584606cf2ccc5ef564'
            '473a23c69a2c3bb69328feb667c8e85a4ff1eb4acd563d5b5349f197bd61be86')
