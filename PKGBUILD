# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: /dev/rs0 <rs0@secretco.de.com>

# TODO: Improve /usr/share/joomla detection for proper packaging
# TODO: eliminate chmod 777 on reports

set -u
pkgname='joomscan'
pkgver='0.0.7'
pkgrel='1'
pkgdesc='Detects file inclusion, sql injection, command execution vulnerabilities of a target Joomla! web site.'
arch=('any')
#url="http://${pkgname}.sourceforge.net/"
url="https://github.com/rezasp/joomscan"
license=('LGPL3')
depends=('perl' 'perl-libwww') # 'perl-switch' 'perl-www-mechanize'
makedepends=('unzip')
options=('!strip')
_srcdir="${pkgname}-${pkgver}"
source=(
    'joomscan.sh'
    #"http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver//_/-}/${pkgname}-latest.zip"
    "${_srcdir}.tgz::https://github.com/rezasp/joomscan/archive/${pkgver}.tar.gz"
)
noextract=("${source[1]##*/}")
sha256sums=('68e29fe5e982b34ab5e35633fac2e3f4672571ed520aca952c80fb0f110124cd'
            'e5bd03f77409a65f7fa4a9768ee640f86e03e422b5def5008d5abe14b4ffc04f')

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm644 'LICENSE.md' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm 'version' 'CHANGELOG.md' 'love.txt' 'README.md' 'LICENSE.md'
  install -d "${pkgdir}/usr/share/${pkgname}/"
  chmod 777 'reports'
  mv * "${pkgdir}/usr/share/${pkgname}/"
  cd ..
  install -Dpm0755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s 'joomscan' "${pkgdir}/usr/bin/${pkgname}.pl"
  set +u
}
set +u
