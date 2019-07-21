# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Det <nimetonmaili g-mail>

set -u
pkgname='jdk-docs'
#pkgver='11.0.1'; _build='13'; _hash='90cf5d8f270a4347a95050320eef3fb7'
pkgver='12.0.2'; _build='10'; _hash='e482c34c86bd4bf8b56c0b35558996b9'
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc='Documentation for Oracle Java Development Kit'
arch=('any')
url='http://www.oracle.com/technetwork/java/javase/downloads/index.html'
license=('custom:Oracle')
depends=("java-environment>=${_major}")
options=('!strip')
source=("https://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/jdk-${pkgver}_doc-all.zip"
        'LICENSE-Oracle-Legal-Notices.txt')
md5sums=('cb94d35ce0c90f72e85827b194d7f6e4'
         '9bba83683c877a75509ff465923ff0e7')
sha256sums=('8541ec6ff1d78f7e36ea6b5cfcf8cf84b8431ebe67d0f68a1f29fd00debd12aa'
            'b60a32e13f7e36df4b05b4d97ad701202c5b16302e47261cd5f24bb795c76050')

DLAGENTS=("${DLAGENTS[@]// -gqb \"\"/ -gq}")
DLAGENTS=("${DLAGENTS[@]//curl -/curl -b 'oraclelicense=a' -}")

package() {
  set -u
  # Install
  install -d "${pkgdir}/usr/share/doc/java${_major}/"
  mv docs/* "${pkgdir}/usr/share/doc/java${_major}/"

  # License
  install -Dpm644 'LICENSE-Oracle-Legal-Notices.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
