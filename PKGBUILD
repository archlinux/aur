# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Andrews <christophersimonandrews at gmail.com>
# Contributor: Dan Serban
# Contributors: Henri HÃ¤kkinenv, Damian Barberon, Netanel Shine, Simon Schneider
# Contributor: Lari Tikkanen <lartza at wippies.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

set -u
pkgname='joomla'
pkgver='3.8.3'
pkgrel='1'
pkgdesc='a php Content Management System (CMS) which enables you to build websites and powerful online applications.'
arch=('any')
url='http://www.joomla.org/'
license=('GPL')
#depends=('php<6')
options=('!strip')
install="${pkgname}.install"
#_verwatch=("http://joomlacode.org/gf/project/${pkgname}/frs/" "Joomla_\(.*\)-Stable-Full_Package\.tar\.bz2" 't')
#source=("http://joomlacode.org/gf/download/frsrelease/20086/162538/Joomla_${pkgver}-Stable-Full_Package.tar.bz2")
_giturl="https://github.com/joomla/${pkgname}-cms"
#_verwatch=("${_giturl}/releases" "${_giturl}/releases/download/[0-9\.]\+/Joomla_\([0-9\.]\+\)-Stable-Full_Package\.tar\.bz2" 'l')
_verwatch=("${_giturl}/releases.atom" '\s\+<link rel="alternate" type="text/html" href="/joomla/joomla-cms/releases/tag/\([0-9\.]\+\)".*' 'f')
source=("${_giturl}/releases/download/${pkgver}/Joomla_${pkgver}-Stable-Full_Package.tar.bz2")
sha256sums=('4f5857a85f9d5fce1212e70a35993390f6231c4e95dbd803e64be7ac6006c980')

package() {
  set -u
  install -dm755 "${pkgdir}/usr/share/webapps"
  cp -pr "${srcdir}" "${pkgdir}/usr/share/webapps/joomla"
  find "${pkgdir}/usr/share/webapps/joomla" -maxdepth 1 -type l -iname '*.bz2' -delete
  find "${pkgdir}/usr/share/webapps/joomla" -type f -exec chmod 0664 '{}' ';'
  find "${pkgdir}/usr/share/webapps/joomla" -type d -exec chmod 0775 '{}' ';'
  chown -R 'root:root' "${pkgdir}/usr/share/webapps/joomla"
  install -D 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
