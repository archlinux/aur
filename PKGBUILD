# Maintainer: Willem Albeda <willem at albeda dot net>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=astah-uml
pkgver=9.0.0.1778f1.0
_pkgver=9.0.0.1778f1-0
pkgrel=2
url='https://astah.net/products/astah-uml'
pkgdesc='Lightweight and easy-to-use UML2.x modeler (With trial)'
arch=('i686' 'x86_64')
license=('custom')
depends=('java-runtime=8'
     'lib32-glibc'
     'hicolor-icon-theme'
     'bash')
conflicts=('astah-community' 'astah-professional')
options=('!emptydirs' '!strip')
source=("http://cdn.change-vision.com/files/astah-uml-${_pkgver}.noarch.rpm")
md5sums=('38f47c1743f535b54e11f0e7792a6fc6')

package() {
  cp -aR "${srcdir}/usr" "${pkgdir}"
  mkdir -p "${pkgdir}/opt/"
  mv "${pkgdir}/usr/lib/astah_uml" "${pkgdir}/opt/astah-uml"
  mkdir -p "${pkgdir}/usr/share/doc/astah-uml/"
  mv "${pkgdir}/opt/astah-uml"/ReferenceManual-* "${pkgdir}/usr/share/doc/astah-uml/"
  mkdir -p "${pkgdir}/usr/share/licenses/astah-uml"
  mv "${pkgdir}/opt/astah-uml"/AstahLicenseAgreement-e.txt "${pkgdir}/usr/share/licenses/astah-uml/LICENSE"
  mv "${pkgdir}/opt/astah-uml"/Astah_API_sample_program_license_agreement.txt "${pkgdir}/usr/share/licenses/astah-uml/LICENSE-API"
  rm "${pkgdir}/usr/bin/astah-uml"
  ln -s /opt/astah-uml/astah-uml "${pkgdir}/usr/bin"
  install -Dm644 "${pkgdir}/opt/astah-uml"/mime-astah_uml.xml "${pkgdir}/usr/share/mime/packages/astah_uml.xml"
  install -Dm644 "${pkgdir}/opt/astah-uml"/astah_uml.desktop -t \
   "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/astah-uml"/astah_uml.png -t \
   "${pkgdir}/usr/share/pixmamps"
  install -Dm644 "${pkgdir}/opt/astah-uml"/astah_uml-doc.png -t \
   "${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/"
  rm "${pkgdir}/opt/astah-uml"/mime-astah_uml.xml
  rm "${pkgdir}/opt/astah-uml"/astah_uml.desktop
  rm "${pkgdir}/opt/astah-uml"/astah_uml-doc.png
  sed -i '/#!\/bin\/sh/a export PATH="\$JAVA_HOME\/bin:\$PATH"' "${pkgdir}/opt/astah-uml/astah-uml"
  sed -i '/#!\/bin\/sh/a export JAVA_HOME=\/usr\/lib\/jvm\/java-8-openjdk\/jre' "${pkgdir}/opt/astah-uml/astah-uml"
}
