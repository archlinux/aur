# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: realitygaps <realitygaps@yahoo.com>
_pkgname=drupal8
pkgname=drupal8-git
pkgver=r38123.3bddf7fcb8
pkgrel=2
pkgdesc="A PHP based content management system - GIT version"
arch=('i686' 'x86_64')
install="drupal8-git.install"
url="http://drupal.org"
license=('GPL')
makedepends=('git')
depends=('php7' 'php7-gd')
options=(!strip)
source=('git+https://git.drupalcode.org/project/drupal.git#branch=8.9.x')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/drupal"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/drupal"
  mkdir -p $pkgdir/usr/share/webapps/drupal8-git
  cp -r ${srcdir}/drupal/{*,.htaccess} ${pkgdir}/usr/share/webapps/drupal8-git
  echo "deny from all" > ${pkgdir}/usr/share/webapps/drupal8-git/.htaccess
}
