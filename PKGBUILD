# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

set -u
_major='8'
pkgname="jdk${_major}-docs"
_minor='202'; _buildjd='b08'; _buildfx='b07'; _hash='1961070e4c9b4e26a04e7f5a083f551e'
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Documentation for Oracle Java ${_major} Development Kit"
arch=('any')
url='http://www.oracle.com/technetwork/java/javase/downloads/index.html'
license=('custom:Oracle')
depends=("java-environment>=${_major}")
options=('!strip')
source=(
  "https://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_buildjd}/${_hash}/jdk-${pkgver}-docs-all.zip"
  "https://download.oracle.com/otn-pub/java/javafx/${_major}.0.${_minor}-${_buildfx}/${_hash}/javafx-${pkgver}-apidocs.zip"
  'LICENSE-Documentation.txt'
  'LICENSE-Oracle-Legal-Notices.txt'
)
md5sums=('2144909fb37ddd8ffb16871904cc342c'
         '719931e920b6ebb4e7058a7024bcc91d'
         '4d54057ca75b691366977dab2277e869'
         '3137397f4dba13f4a79157819af583a3')
sha256sums=('c036b8daf867925cc7eb59dfd2f50a72c66f88128a9c174d98bafeb907e56e74'
            '01c164a03ff5046dc06d0d3ea30dd9f0e969eda52bd774ff145c2b1c381fe22b'
            '14dc1953902010f7b48891e795183b39c048b19881815eec6a57cf3d62631ab7'
            '99e666088f11baacfe1816747e69441a7002e024ac0d7a4ca4092c6cb2658c9f')

DLAGENTS=("${DLAGENTS[@]//curl -/curl -b 'oraclelicense=a' -}")

package() {
  set -u
  # Create Dirs
  install -d "${pkgdir}/usr/share/doc/java${_major}/javafx/"

  # Install
  mv docs/* "${pkgdir}/usr/share/doc/java${_major}/"
  mv api "${pkgdir}/usr/share/doc/java${_major}/javafx/"

  # License
  install -Dpm644 'LICENSE-Oracle-Legal-Notices.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
