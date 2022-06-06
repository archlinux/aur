# Maintainer: Chris G. <chris-git@gmx.com>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>


set -u
_major='8'
pkgname="jdk${_major}-docs"
_minorjd='333'
_buildjd='b02'
_hashjd='61ae65e088624f5aaa0b1d2d801acb16'
_minorfx='331'
_buildfx='b09'
_hashfx='165374ff4ea84ef0bbd821706e29b123'
pkgver="${_major}u${_minorjd}"
pkgverfx="${_major}u${_minorfx}"
pkgrel='2'
pkgdesc="Documentation for Oracle Java ${_major} Development Kit"
arch=('any')
url='http://www.oracle.com/technetwork/java/javase/downloads/index.html'
license=('custom:Oracle')
depends=("java-environment>=${_major}")
options=('!strip')
source=(
  "https://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_buildjd}/${_hashjd}/jdk-${pkgver}-docs-all.zip"
  "https://download.oracle.com/otn-pub/java/javafx/${_major}.0.${_minorfx}-${_buildfx}/${_hashfx}/javafx-${pkgverfx}-apidocs.zip"
  'LICENSE-Documentation.txt'
  'LICENSE-Oracle-Legal-Notices.txt'
)
sha256sums=('f239e56e5edbff116c6dbe10844a69712f008530323aa75c31be9685e1752f02'
            '753a7a3bae59891b1359d0f0b3e9e390cf2b8762465e1f79895bfb43204c72d9'
            '14dc1953902010f7b48891e795183b39c048b19881815eec6a57cf3d62631ab7'
            '99e666088f11baacfe1816747e69441a7002e024ac0d7a4ca4092c6cb2658c9f')
sha512sums=('4296cc9630b8a46a1b56475036eb5bd615062b23df512645f219d4fd88a9cfc3c93dc037233bfba59b5464b273f4412fa2c382b7b529f05cf8d6d88274ec4df2'
            '8617459b1425bc3479ccca7e8e056211f2ba48bcfb4a92e0fdafe4f0ae02e2e42c2ef15a464059c1843b4506ab9b815f602caea3a0457a3f3c22c79e78b59a7d'
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
