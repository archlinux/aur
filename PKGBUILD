# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>


set -u
_major='8'
pkgname="jdk${_major}-docs"
_minor='251'
_buildjd='b08'
_buildfx='b08'
_hash='3d5a2bb8f8d4428bbe94aed7ec7ae784'
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
sha256sums=('5896d516c1bd413478545ad0f8866ace'
         '2c6646773c33e0dae2fe42a11b39f319'
         '4d54057ca75b691366977dab2277e869'
         '3137397f4dba13f4a79157819af583a3')
sha512sums=('c1a3e31cc0250a573c7103b45167787c213bd0c64a3627d42f6101a625d6aa9f'
            '8b8930a0f7855403d1d6d2f1e20dae993cf251cd2bf50c0cc653e70c26a38319'
            '14dc1953902010f7b48891e795183b39c048b19881815eec6a57cf3d62631ab7'
            '99e666088f11baacfe1816747e69441a7002e024ac0d7a4ca4092c6cb2658c9f')

DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

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
