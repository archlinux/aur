# Maintainer: realitygaps <realitygaps@yahoo.com>
pkgname=drupal8-git
pkgver=20110620
pkgrel=1
pkgdesc="A PHP based content management system - GIT version"
arch=('i686' 'x86_64')
install="drupal8-git.install"
url="http://drupal.org"
license=('GPL')
makedepends=('git')
depends=('php')

_gitroot="--branch 8.0.x http://git.drupal.org/project/drupal.git"
_gitname="drupal8-git"

package() {
  cd "$srcdir"
  echo "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    echo "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  echo "GIT checkout done or server timeout"
  echo "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  mkdir -p $pkgdir/usr/share/webapps/drupal8-git
  cp -r $srcdir/drupal8-git/{*,.htaccess} $pkgdir/usr/share/webapps/drupal8-git
  echo "deny from all" > $pkgdir/usr/share/webapps/drupal8-git/.htaccess
}
