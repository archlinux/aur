# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Det <nimetonmaili g-mail>

pkgname='jdk-docs'
pkgver='15.0.1'
_build=9
_hash=51f4f36ad4ef43e39d0dfdbaf6549e32
_majver="${pkgver%%.*}"
_next="$((_majver + 1))"
pkgrel='1'
pkgdesc='Documentation for Oracle Java Development Kit'
arch=('any')
url='https://www.oracle.com/technetwork/java/javase/downloads/index.html'
license=('custom:Oracle')
depends=("java-environment>=${_majver}")
options=('!strip')
source=("https://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/jdk-${pkgver}_doc-all.zip"
        'LICENSE-Oracle-Legal-Notices.txt')
sha256sums=('3d761155f111bcc16e643432c39241d97e3d7bed202e5376b2416d67b2a696e8'
            'b60a32e13f7e36df4b05b4d97ad701202c5b16302e47261cd5f24bb795c76050')

DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {
  set -u
  # Install
  install -d "${pkgdir}/usr/share/doc/java${_majver}/"
  mv docs/* "${pkgdir}/usr/share/doc/java${_majver}/"

  # License
  install -Dpm644 'LICENSE-Oracle-Legal-Notices.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}

