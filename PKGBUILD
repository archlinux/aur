# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Andrews <christophersimonandrews at gmail.com>
# Contributor: Dan Serban
# Contributors: Henri HÃ¤kkinenv, Damian Barberon, Netanel Shine, Simon Schneider
# Contributor: Lari Tikkanen <lartza at wippies.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

set -u
pkgname='joomla'
pkgver='3.5.1'
pkgrel='1'
pkgdesc='a php Content Management System (CMS) which enables you to build websites and powerful online applications.'
arch=('any')
url='http://www.joomla.org/'
#_watch=('http://www.joomla.org/download.html',' ([\d.]*) Full Package')
license=('GPL')
#depends=('php<6')
options=('!strip')
install="${pkgname}.install"
#_verwatch=("http://joomlacode.org/gf/project/${pkgname}/frs/" "Joomla_\(.*\)-Stable-Full_Package\.tar\.bz2" 't')
#source=("http://joomlacode.org/gf/download/frsrelease/20086/162538/Joomla_${pkgver}-Stable-Full_Package.tar.bz2")
_giturl="https://github.com/joomla/${pkgname}-cms"
_verwatch=("${_giturl}/releases" "${_giturl}/releases/download/[0-9\.]\+/Joomla_\([0-9\.]\+\)-Stable-Full_Package\.tar\.bz2" 'l')
source=("${_giturl}/releases/download/${pkgver}/Joomla_${pkgver}-Stable-Full_Package.tar.bz2")
sha256sums=('26ef163f5bed448eabaf9771c5897b962b2121f505e94cb50704a80e3a716e47')

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
