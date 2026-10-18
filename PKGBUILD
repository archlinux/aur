# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgnick='FontLib'
_pkgname='php-font-lib'
pkgname="${_pkgname}"
pkgver='1.0.2'
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
md5sums=('b4d91a387e931bfc8899e0149a16f0bd')
sha256sums=('eadf726426d1b54e5bf69c12f4532be97f4616d2cb4989f07569ce06df5371e8')

prepare() {
  local -; set -u
  cd "${_srcdir}"
  # Putting the maps in webapps like Debian did makes no sense. What other package will use this without conflict?
  sed -i -e 's:/\.\./maps/:/maps/:g' "src/${_pkgnick}/AdobeFontMetrics.php"
}

package() {
  local -; set -u
  cd "${_srcdir}"

  install -d "${pkgdir}/usr/share/webapps/"
  mv "src/${_pkgnick}" "${pkgdir}/usr/share/webapps/"
  mv 'maps' "${pkgdir}/usr/share/webapps/${_pkgnick}/"

  install -Dpm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
set +u
