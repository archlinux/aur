# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-hostmaster
_pkgname=${pkgname##*-}
pkgver=7.x_3.6
pkgrel=2
pkgdesc="mass Drupal hosting system - frontend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')
source=("https://ftp.drupal.org/files/projects/$_pkgname-${pkgver//_/-}-core.tar.gz"
        "https://ftp.drupal.org/files/projects/devel_debug_log-7.x-1.2.tar.gz"
        "https://ftp.drupal.org/files/projects/devel-7.x-1.5.tar.gz")
md5sums=('642925101fa0a842601b5d6e35741d02'
         '19561aa1a0f2e549acf5c44a8cad8e14'
         'f06c912eb4edbd48fbcc2867516726a3')

package() {
  install -dm755 "$pkgdir/usr/share/webapps/$_pkgname"
  install -dm755 "$pkgdir/var/lib/$_pkgname"

  cp -a $_pkgname-${pkgver//_/-}/* "$pkgdir/usr/share/webapps/$_pkgname"
  mv "$pkgdir/usr/share/webapps/$_pkgname/sites" "$pkgdir/var/lib/$_pkgname"
  ln -s "/var/lib/$_pkgname/sites" "$pkgdir/usr/share/webapps/$_pkgname"
  cp -a devel devel_debug_log "$pkgdir/var/lib/$_pkgname/sites/all/modules"

  install -Dm644 <( ) "$pkgdir/var/lib/$_pkgname/sites/all/drush/drushrc.php"
  install -Dm644 <( ) "$pkgdir/var/lib/$_pkgname/sites/sites.php"

  find "$pkgdir/var/lib/$_pkgname" -perm /u+w -exec chmod g+w {} +
  chown -R http:http "$pkgdir/var/lib/$_pkgname"
}
