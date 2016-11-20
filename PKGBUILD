# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-provision
_pkgname=${pkgname##*-}
pkgver=7.x_3.8
pkgrel=1
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')
source=("https://ftp.drupal.org/files/projects/$_pkgname-${pkgver//_/-}.tar.gz")
md5sums=('459431926769afb2fd129ca859592228')

package() {
    cd $_pkgname

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install --directory "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"
    cp --archive * "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"
    #~ ls -l
    # pwd

    # ls -l "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"

    msg2 'Moving doc files to /usr/share/doc'
    install --directory "$pkgdir/usr/share/doc/$_pkgname"
    for file in example.drushrc.php example.sudoers README.md upgrade.sh.txt; do
      mv $pkgdir/usr/share/{webapps/drush/commands,doc}/$_pkgname/$file
      ln --relative --symbolic $pkgdir/usr/share/{doc,webapps/drush/commands}/$_pkgname/$file
    done

# echo "${option[@]}"
}
