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
sha256sums=('c1a3e31cc0250a573c7103b45167787c213bd0c64a3627d42f6101a625d6aa9f'
            '8b8930a0f7855403d1d6d2f1e20dae993cf251cd2bf50c0cc653e70c26a38319'
            '14dc1953902010f7b48891e795183b39c048b19881815eec6a57cf3d62631ab7'
            '99e666088f11baacfe1816747e69441a7002e024ac0d7a4ca4092c6cb2658c9f')
sha512sums=('bf24cbe1e538b6fa6d423065d31869a7dea867ad363950c36a4bbeb3abeeae69aac18fbee251d2da420056976402289cbdb80cf2e5fcf88f3063b7d98d61c8cb'
            'c18df3cc880df2c6ca5a5ef489b46b18a7ab8e495b4073bcf7ca9c8bbca5e6e1b67fb55456cd84f5edd341b772253597b2b0268bc3a0c6cae6f387b5267f8c42'
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
