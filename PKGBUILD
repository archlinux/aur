# Maintainer David Runge <dave@sleepmap.de>
# Contributor Stefan Tatschner <stefan@sevenbyte.org>

pkgname=roundcube-rcmcarddav
_plugin_name=rcmcarddav
_internal_name=carddav
pkgver=2.0.4
pkgrel=1
pkgdesc="CardDAV plugin for RoundCube Webmailer"
arch=('any')
url="https://github.com/blind-coder/rcmcarddav"
license=('GPL')
depends=('roundcubemail')
backup=("etc/webapps/roundcubemail/plugins/${_internal_name}/config.inc.php")
source=("https://github.com/blind-coder/${_plugin_name}/releases/download/v${pkgver}/${_internal_name}-${pkgver}.tar.bz2")
sha512sums=('a9eeb5ef324872d02988abc89297e2d545baa8ad6734eb342b40418322489b8e6253a1d8397141edbf6055345cdbf1f170c6965ef24075f8ec9da26fe1d01a5b')

package() {
  # create directories for plugin and config
  mkdir -p ${pkgdir}/{usr/share,etc}/webapps/roundcubemail/plugins/${_internal_name}

  # copy all files to plugin directory
  cp -ra ${_internal_name}/* ${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_internal_name}

  # copy config and symlink it
  cp ${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_internal_name}/config.inc.php.dist \
    ${pkgdir}/etc/webapps/roundcubemail/plugins/carddav/config.inc.php
  ln -s "/etc/webapps/roundcubemail/plugins/${_internal_name}/config.inc.php" \
    ${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_internal_name}/config.inc.php
}
