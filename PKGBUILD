# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgnick='FontLib'
_pkgname='php-font-lib'
pkgname="${_pkgname}"
pkgver='1.0.1'
pkgrel='1'
pkgdesc="${_pkgnick} :: A library to read, parse, export and make subsets of different types of font files."
arch=('any')
url='https://github.com/PhenX/php-font-lib'
license=('LGPL-2.1-only')
depends=('php>=5.3')
options=('!strip')
_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
_srcdir="${_pkgname}-${pkgver}"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('f50bf1cbfef9484d39742176588203df')
sha256sums=('0deaa84c9c72684564bd85c50de1d6256b4a68853205bfb4a7b507c4f0e50506')

prepare() {
  set -u
  cd "${_srcdir}"
  # Putting the maps in webapps like Debian did makes no sense. What other package will use this without conflict?
  sed -i -e 's:/\.\./maps/:/maps/:g' "src/${_pkgnick}/AdobeFontMetrics.php"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  install -d "${pkgdir}/usr/share/webapps/"
  mv "src/${_pkgnick}" "${pkgdir}/usr/share/webapps/"
  mv 'maps' "${pkgdir}/usr/share/webapps/${_pkgnick}/"

  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  set +u
}
set +u
