# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgnick='FontLib'
_pkgname='php-font-lib'
pkgname="${_pkgname}"
pkgver='0.5.1'
pkgrel='1'
pkgdesc="${_pkgnick} :: A library to read, parse, export and make subsets of different types of font files."
arch=('any')
url='https://github.com/PhenX/php-font-lib'
license=('LGPL')
depends=('php>=5.3')
options=('!strip')
_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('bdd9ed12ac72a4a4a04052cfc784f25d646fd6ad56e56e4573394c89933cf85a')

prepare() {
  set -u
  cd "${_pkgname}-${pkgver}"
  # Putting the maps in webapps like Debian did makes no sense. What other package will use this without conflict?
  sed -i -e 's:/\.\./maps/:/maps/:g' "src/${_pkgnick}/AdobeFontMetrics.php"
  set +u
}

package() {
  set -u
  cd "${_pkgname}-${pkgver}"
  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -d "${pkgdir}/usr/share/webapps/"
  mv "src/${_pkgnick}" "${pkgdir}/usr/share/webapps/"
  mv 'maps' "${pkgdir}/usr/share/webapps/${_pkgnick}/"
  set +u
}
set +u
