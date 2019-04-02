# Maintainer:     Jaja <jaja@mailbox.org>
# Co-maintainer:  alisoftware <admin@situsali.com>
#

pkgname=jsignpdf
pkgver=1.6.4
pkgrel=2
pkgdesc="Digitally sign PDF files with X.509 certificates in GUI and CLI."
arch=('any')
url="http://jsignpdf.sourceforge.net/"
license=('LGPL' 'MPL' 'CCPL' 'Apache' 'custom')
depends=('java-runtime>=8'
         'bash')
optdepends=('hicolor-icon-theme: icon for launcher'
            'desktop-file-utils: MIME cache update')
source=(
  ${pkgname}-${pkgver}.zip::"https://downloads.sourceforge.net/project/jsignpdf/stable/JSignPdf%20${pkgver}/JSignPdf-${pkgver}.zip"
  jsignpdf_48.png::"https://raw.githubusercontent.com/kwart/jsignpdf/master/doc/icon/iconverticons.com/signedpdf_48x48x32.png"
  jsignpdf_128.png::"https://raw.githubusercontent.com/kwart/jsignpdf/master/doc/icon/iconverticons.com/signedpdf_128x128x32.png"
  "supplementary.tar.xz")
md5sums=('a459876cba8e2d30abcf9baaf16ff986'
         'a44ef91da28d94fb949e361d19adbbd5'
         'bf2d11e38c706fe183900cce1fab0e38'
         '0d2ebc62ed6bffa1e387fa0ba957cd2a')
changelog=changelog
backup=('usr/share/java/jsignpdf/conf/conf.properties'
        'usr/share/java/jsignpdf/conf/pkcs11.cfg')

package() {
  ## file and directory permissions for mv and cp: u=rwx,g=rx,o=rx
  umask 022
  ## licenses
  install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  mv "${srcdir}/${pkgname}-${pkgver}"/docs/ThirdPartyLicenses/* "${pkgdir}"/usr/share/licenses/"${pkgname}"
  ## documentation
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/docs/JSignPdf_signed.pdf "${pkgdir}"/usr/share/doc/"${pkgname}"/Quickstart.pdf
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/docs/ReleaseNotes.txt "${pkgdir}"/usr/share/doc/"${pkgname}"/ReleaseNotes
  install -d "${pkgdir}"/usr/share/man
  mv "${srcdir}"/manpages/* "${pkgdir}"/usr/share/man
  ## programm files
  install -Dm644 "${srcdir}"/pictures/splash.png "${pkgdir}"/usr/share/java/"${pkgname}"/splash.png
  rm -r "${srcdir}/${pkgname}-${pkgver}"/docs
  mv "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}"/usr/share/java/"${pkgname}"
  ## executable scripts
  install -Dm755 "${srcdir}"/launchers/jsignpdf.sh "${pkgdir}"/usr/bin/jsignpdf
  install -Dm755 "${srcdir}"/launchers/jsignpdf-installcert.sh "${pkgdir}"/usr/bin/jsignpdf-installcert
  install -Dm755 "${srcdir}"/launchers/jsignpdf-verifier.sh "${pkgdir}"/usr/bin/jsignpdf-verifier
  install -Dm755 "${srcdir}"/launchers/jsignpdf-signaturecounter.sh "${pkgdir}"/usr/bin/jsignpdf-signaturecounter
  ## .icon and .desktop files
  install -Dm644 "${srcdir}"/jsignpdf_48.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/jsignpdf_128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/"${pkgname}".png
  install -Dm644 "${srcdir}"/launchers/jsignpdf.desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
}
