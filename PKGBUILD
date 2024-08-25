# Maintainer: Diego Cirilo <dvcirilo at gmail dot com>
# Contributor: Willem Albeda <willem at albeda dot net>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=astah-viewer
pkgver=9.2.0.0248cd_0
_pkgver=9.2.0.0248cd-0
pkgrel=1
url='https://astah.net/products/astah-viewer'
pkgdesc='Free tool to view .astah files'
arch=(any)
license=('LicenseRef-Custom')
depends=('java-runtime=8' 'hicolor-icon-theme' 'bash')
options=('!emptydirs' '!strip')
source=("http://cdn.change-vision.com/files/astah-viewer-${_pkgver}.noarch.rpm")
md5sums=('5add9d83c8721fe3edc94e7d36d1c43d')

package() {
  cp -aR "${srcdir}/usr" "${pkgdir}"
  mkdir -p "${pkgdir}/opt/"
  mv "${pkgdir}/usr/lib/astah_viewer" "${pkgdir}/opt/astah-viewer"
  mkdir -p "${pkgdir}/usr/share/doc/astah-viewer/"
  mv "${pkgdir}/opt/astah-viewer"/ReferenceManual-* "${pkgdir}/usr/share/doc/astah-viewer/"
  mkdir -p "${pkgdir}/usr/share/licenses/astah-viewer"
  mv "${pkgdir}/opt/astah-viewer"/AstahLicenseAgreement-e.txt "${pkgdir}/usr/share/licenses/astah-viewer/LICENSE"
  rm "${pkgdir}/usr/bin/astah-vwr"
  ln -s /opt/astah-viewer/astah-vwr "${pkgdir}/usr/bin/astah-viewer"
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
