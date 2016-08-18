# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-provision
_pkgname=${pkgname##*-}
pkgver=7.x_3.7
pkgrel=1
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')
source=("https://ftp.drupal.org/files/projects/$_pkgname-${pkgver//_/-}.tar.gz")
md5sums=('307263f7ea083b7fddd5e5c08abd1d8c')

package() {
    cd $_pkgname

    msg2 'Adding doc files'
    for file in example.drushrc.php example.sudoers README.txt; do
      install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
    done

    msg2 'Adding main files'
    for file in Vagrantfile provision.* *.inc *.make; do
      install -Dm644 "$file" "$pkgdir/usr/share/webapps/drush/commands/$_pkgname/$file"
    done
    for dir in Provision Symfony db dns http platform provision-tests scripts; do
      cp --archive "$dir" "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"
    done
}
