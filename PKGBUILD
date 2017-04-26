# Maintainer: Jake <ja.ke@posteo.de>
# Contributor: Aurelien Cibrario <aurelien.cibrario at gmail dot com>
# Contributor: David Manouchehri <manouchehri at riseup dot net>
# Contributor: Peter-Paul van Gemerden <info at ppvg dot nl>
# Contributor: Karsten Hinz <k.hinz at tu-bs dot de>

pkgname=pycam
pkgver=0.6.1
pkgrel=1
pkgdesc="Toolpath generator for 3-axis CNC machining, written in Python."
arch=('i686' 'x86_64')
url="http://pycam.sourceforge.net/"
license=('GPL3')
depends=('python2' 'pygtk' 'python2-opengl' 'python2-rsvg' 'python2-gtkglext')
source=("https://github.com/SebKuzminsky/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz" 
        "GLUTfix.patch"
        "${pkgname}")
sha512sums=('962d6ba5b5790d244ac47684c2d67b791b91725a30c014a821925706e322b0cb43ce29b5b90b5e917e04151fdd5806916132ef8d9bfb3bd7fb854b558066827a'
            '8d3a4610acad8a8f0dfcbcb62273f420f44b0db4c5e2c236eacbf49d5abd73394de3e302dfec1a6109160869513304274c74f784dc7f3c0fae505348868e90d5'
            'fbb1b026dfa821caea352f44aa5eddb34fcb8ec87e27bf1390fb791b58733c011f5476203a5195bb1e737cd6194000c8ec30ac7444f638c2b70965071757c092')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -R -p1 -i "${srcdir}/GLUTfix.patch"
}

package() {
  # Application
  mkdir -p "${pkgdir}/usr/share/"
  cp -R "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"

  # Start script
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # freedesktop.org compatibility
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/share/desktop/pycam.desktop" "${pkgdir}/usr/share/applications/pycam.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/share/mime/icons/32x32/application-sla.png" "${pkgdir}/usr/share/pixmaps/pycam.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/share/mime/application-sla.svg" "${pkgdir}/usr/share/pixmaps/pycam.svg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/share/mime/pycam.xml" "${pkgdir}/usr/share/mime/application/pycam.xml"
}
