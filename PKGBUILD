# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tess 'socketwench' Flynn <tess@deninet.com>
pkgname=drush-git
pkgver=6.0.0.r500.gbf45cb4
pkgrel=1
pkgdesc="The Drupal command-line shell, git version."
arch=('any')
url="https://github.com/drush-ops/drush"
license=('GPL')
depends=('php' 'bash' 'php-composer')
conflicts=('drush5' 'drush')
install=${pkgname}.install
source=("$pkgname"::'git://github.com/drush-ops/drush.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
}

package() {
  cd "$pkgname"

  install -d ${pkgdir}/usr/share/webapps/drush/commands
  cp -rf ${srcdir}/${pkgname}/commands/* ${pkgdir}/usr/share/webapps/drush/commands/

  install -d ${pkgdir}/usr/share/webapps/drush/docs
  cp -rf ${srcdir}/${pkgname}/docs/* ${pkgdir}/usr/share/webapps/drush/docs/

  install -d ${pkgdir}/usr/share/webapps/drush/examples
  cp -rf ${srcdir}/${pkgname}/examples/* ${pkgdir}/usr/share/webapps/drush/examples/

  install -d ${pkgdir}/usr/share/webapps/drush/includes
  cp -rf ${srcdir}/${pkgname}/includes/* ${pkgdir}/usr/share/webapps/drush/includes/

  install -d ${pkgdir}/usr/share/webapps/drush/lib
  cp -rf ${srcdir}/${pkgname}/lib/* ${pkgdir}/usr/share/webapps/drush/lib/

  install -d ${pkgdir}/usr/share/webapps/drush/misc
  cp -rf ${srcdir}/${pkgname}/misc/* ${pkgdir}/usr/share/webapps/drush/misc/

  install -d ${pkgdir}/usr/share/webapps/drush/tests
  cp -rf ${srcdir}/${pkgname}/tests/* ${pkgdir}/usr/share/webapps/drush/tests/

  install -Dm755 ./composer.json ${pkgdir}/usr/share/webapps/drush/composer.json || return 1
  install -Dm755 ./drush ${pkgdir}/usr/share/webapps/drush/drush || return 1
  install -Dm755 ./drush.complete.sh ${pkgdir}/usr/share/webapps/drush/drush.complete.sh || return 1
  install -Dm644 ./drush.info ${pkgdir}/usr/share/webapps/drush/drush.info || return 1
  install -Dm755 ./drush.php ${pkgdir}/usr/share/webapps/drush/drush.php || return 1
  install -Dm644 ./drush_logo-black.png ${pkgdir}/usr/share/webapps/doc/drush/drush_logo-black.png || return 1
  install -Dm644 ./README.md ${pkgdir}/usr/share/webapps/doc/drush/README.txt || return 1
  install -Dm644 ./unish.sh ${pkgdir}/usr/share/webapps/doc/drush/unish.sh || return 1
  install -Dm644 ./docs/drush.api.php ${pkgdir}/usr/share/webapps/drush/drush.api.php || return 1
  install -Dm644 ./examples/example.drushrc.php ${pkgdir}/usr/share/webapps/drush/example.drushrc.php || return 1
  install -Dm644 ./examples/example.aliases.drushrc.php ${pkgdir}/usr/share/webapps/drush/example.aliases.drushrc.php || return 1
  install -Dm644 ./examples/example.drush.ini ${pkgdir}/usr/share/webapps/drush/example.drush.ini || return 1
  mkdir -p ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/drush/drush ${pkgdir}/usr/bin/drush
  #Make directory for eventual packaged drush extensions
  #mkdir -p ${pkgdir}/usr/share/webapps/drush/commands
}
