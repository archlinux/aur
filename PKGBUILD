# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=roundcube-rcmcarddav
_plugin_name=rcmcarddav
_name=carddav
pkgver=3.0.2
pkgrel=1
pkgdesc="CardDAV plugin for RoundCube Webmailer"
arch=('any')
url="https://github.com/blind-coder/rcmcarddav"
license=('GPL2')
depends=('roundcubemail')
backup=("etc/webapps/roundcubemail/plugins/${_name}/config.inc.php")
source=("https://github.com/blind-coder/${_plugin_name}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.bz2")
sha512sums=('53e46a70817ccfe3840d7d4c5236d8c93a8c8dbcdfe0fd527ef8d1452c00b65297a3a19ef01799236431e8daf2eea4fd517f3830d347b52b42d6f5be46220291')

prepare() {
  mv -v "${_name}" "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"
  # php and xml
  install -vDm 644 *.{php,xml} \
    -t "${pkgdir}"/usr/share/webapps/roundcubemail/plugins/"${_name}"
  install -vDm 644 skins/classic/*.css -t \
    "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/skins/classic/"
  # css
  install -vDm 644 skins/larry/*.css \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/skins/larry/"
  install -vDm 644 localization/*.inc \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/localization/"
  # db migrations
  install -vDm 644 dbmigrations/0000-dbinit/*.sql \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/dbmigrations/0000-dbinit"
  install -vDm 644 dbmigrations/0000-sample/*.sql \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/dbmigrations/0000-sample"
  install -vDm 644 dbmigrations/0001-categories/*.sql \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/dbmigrations/0001-categories"
  install -vDm 644 dbmigrations/0002-increasetextfieldlengths/*.sql \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/dbmigrations/0002-increasetextfieldlengths"
  install -vDm 644 dbmigrations/0003-fixtimestampdefaultvalue/*.sql \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/dbmigrations/0003-fixtimestampdefaultvalue"
  install -vDm 644 dbmigrations/0004-fixtimestampdefaultvalue/*.sql \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/dbmigrations/0004-fixtimestampdefaultvalue"
  install -vDm 644 dbmigrations/0005-changemysqlut8toutf8mb4/*.sql \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/dbmigrations/0005-changemysqlut8toutf8mb4"
  # copy vendor files to plugin directory
  cp -av vendor \
    -t "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/"
  # configuration
  install -vDm 644 config.inc.php.dist \
    "${pkgdir}/etc/webapps/roundcubemail/plugins/carddav/config.inc.php"
  ln -sv "/etc/webapps/roundcubemail/plugins/${_name}/config.inc.php" \
    "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_name}/config.inc.php"
  # docs
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
