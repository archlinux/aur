# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgnick='FontLib'
_pkgname='php-font-lib'
pkgname="${_pkgname}"
pkgver='0.4'
pkgrel='1'
pkgdesc="${_pkgnick} :: A library to read, parse, export and make subsets of different types of font files."
arch=('any')
url='https://github.com/PhenX/php-font-lib'
license=('LGPL')
depends=('php>=5.3')
options=('!strip')
_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c37b5ac553b039b8406f26911595310ecb5563add3b94dbc1dadaa073554becf')

prepare() {
  set -u
  cd "${_pkgname}-${pkgver}"
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
