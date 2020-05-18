# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Det <nimetonmaili g-mail>

pkgname='jdk-docs'
pkgver='14.0.1'
_build=7
_hash=664493ef4a6946b186ff29eb326336a2
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
sha256sums=('ec3e41df14e63ee111a716126191464bc8791f98e50c3188e258aab3010fdc9d'
            'b60a32e13f7e36df4b05b4d97ad701202c5b16302e47261cd5f24bb795c76050')
sha512sums=('d20493c0a95f7fef418c7ffbad102c2161c210e9bbdfbc785b31444a13d1dddd6fb51e63b9967f07320d87111932b4fb534f1585e94884d343736d6f7ea6b839'
            '95a8b5fe80c350622b48a4d9714fdd66fdb9d51e70206f9d6bd7d452bb048e50f08082a90fc8654bcc81af52cc171669c12346a96d42294d5f99db7d0e2deaa1')

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
