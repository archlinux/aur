# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>


set -u
_major='8'
pkgname="jdk${_major}-docs"
_minor='271'
_buildjd='b09'
_buildfx='b08'
_hash='61ae65e088624f5aaa0b1d2d801acb16'
pkgver="${_major}u${_minor}"
pkgrel='2'
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
sha256sums=('2b7b561ac5fff20d70b1c0bab7ca083cd362170681ae12d7c4bb09a07bd0568f'
            'f6efa15212263b014dbd104f13badcc453ac5df6c18b0d30a81989b506dc6444'
            '14dc1953902010f7b48891e795183b39c048b19881815eec6a57cf3d62631ab7'
            '99e666088f11baacfe1816747e69441a7002e024ac0d7a4ca4092c6cb2658c9f')
sha512sums=('a053ee9466153936c8d423ecdd8c5868f6326d5903a88b828ab977e6319d3bf0fba6f8f1e9500cdc0c226d46cde7d01f7a7a595447c416f6e2c0af611f8c45ee'
            '0174736066a1f8d8cbaf9420617e7f7b7162b670365010b9895a76751edb4033aa7dbaf7313df4c4644872a8eb9cd56a036f4619491bcda50d6a7a8c15f43dc4'
            '16ec94fa0739547af03192be3bc4ba74888fc0f3c1fefb2a1be3e0801f52f62af438dab91669a1598da30eb45e0ce2d9694e5fc106c77a42411828c4b29cf751'
            '5137995bf26bbae92d5e33107a1c90ec88ea67bd3b22d28166e3c47cece04c67685f012fec2c61e41be86e07842b93ec1f72a4e05d47111b0f21de060c3b09ad')

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
