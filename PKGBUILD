# Maintainer: Diego Cirilo <dvcirilo at gmail dot com>

pkgname=astah-viewer
pkgver=9.1.0.448a59.0
_pkgver=9.1.0.448a59-0
pkgrel=1
url='https://astah.net/products/astah-viewer'
pkgdesc='Free tool to view .astah files'
arch=('i686' 'x86_64')
license=('custom')
depends=('java-runtime=8' 'lib32-glibc' 'hicolor-icon-theme' 'bash')
conflicts=('astah-community' 'astah-professional')
options=('!emptydirs' '!strip')
source=("http://cdn.change-vision.com/files/astah-viewer-${_pkgver}.noarch.rpm")
md5sums=('c3cafd85cccdaeb1d58753c199912903')

package() {
  cp -aR "${srcdir}/usr" "${pkgdir}"
  mkdir -p "${pkgdir}/opt/"
  mv "${pkgdir}/usr/lib/astah_viewer" "${pkgdir}/opt/astah-viewer"
  mkdir -p "${pkgdir}/usr/share/doc/astah-viewer/"
  mv "${pkgdir}/opt/astah-viewer"/ReferenceManual-* "${pkgdir}/usr/share/doc/astah-viewer/"
  mkdir -p "${pkgdir}/usr/share/licenses/astah-viewer"
  mv "${pkgdir}/opt/astah-viewer"/AstahLicenseAgreement-e.txt "${pkgdir}/usr/share/licenses/astah-viewer/LICENSE"
  rm "${pkgdir}/usr/bin/astah-vwr"
  ln -s /opt/astah-viewer/astah-vwr "${pkgdir}/usr/bin"
  install -Dm644 "${pkgdir}/opt/astah-viewer"/mime-astah_viewer.xml "${pkgdir}/usr/share/mime/packages/astah_viewer.xml"
  install -Dm644 "${pkgdir}/opt/astah-viewer"/astah_viewer.desktop -t \
   "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/astah-viewer"/astah_viewer.png -t \
   "${pkgdir}/usr/share/pixmamps"
  install -Dm644 "${pkgdir}/opt/astah-viewer"/astah_viewer-doc.png -t \
   "${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/"
  rm "${pkgdir}/opt/astah-viewer"/mime-astah_viewer.xml
  rm "${pkgdir}/opt/astah-viewer"/astah_viewer.desktop
  rm "${pkgdir}/opt/astah-viewer"/astah_viewer-doc.png
  sed -i '/#!\/bin\/sh/a export PATH="\$JAVA_HOME\/bin:\$PATH"' "${pkgdir}/opt/astah-viewer/astah-vwr"
  sed -i '/#!\/bin\/sh/a export JAVA_HOME=\/usr\/lib\/jvm\/java-8-openjdk\/jre' "${pkgdir}/opt/astah-viewer/astah-vwr"
}
