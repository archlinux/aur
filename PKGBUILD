# Maintainer: James An <james@jamesan.ca>

pkgname=(
    'aegir-up'
    'drupal-up'
    'drush-hosts'
    'drush-vagrant'
)
pkgbase='drush'
pkgver='7.x'
pkgrel=1
pkgdesc="Various Drush extensions"
arch=('any')
url='http://github.com/drush-ops/drush/'
license=('GPL')
groups=('drupal')
depends=('drush')
install=install
source=(
    'install'
    'http://ftp.drupal.org/files/projects/aegir-up-7.x-2.0-rc3.tar.gz'
    'http://ftp.drupal.org/files/projects/drupal-up-7.x-1.0-beta3.tar.gz'
    'http://ftp.drupal.org/files/projects/drush-hosts-7.x-1.1.tar.gz'
    'http://ftp.drupal.org/files/projects/drush-vagrant-7.x-2.0-rc4.tar.gz'
)
md5sums=('f68c7407446bc4dfe95fbe1741928a15'
         '29bd5f0bab1911aca72708165590fd94'
         '0ecb568037d3425c25f971234359c4eb'
         '44401d4fdc8bd5b18919f1db17716664'
         '8d735f9e8f864424f292d4866a70b8f1')


package_aegir-up() {
    pkgver=2.0_rc3
    pkgdesc='Blueprint provider for Drush Vagrant to build a local Aegir VMs'
    url='https://www.drupal.org/project/aegir_up'
    depends=('drush-vagrant')
    _package
}
package_drupal-up() {
    pkgver=1.0_beta3
    pkgdesc='Blueprint provider for Drush Vagrant to build local Drupal VMs'
    url='https://www.drupal.org/project/drupal_up'
    depends=('drush-vagrant')
    _package
}
package_drush-hosts() {
    pkgver=1.1
    pkgdesc='Simple commands for managing entries in /etc/hosts'
    url='https://www.drupal.org/project/drush_hosts'
    _package
}
package_drush-vagrant() {
    pkgver=2.0_rc4
    pkgdesc='Vagrant templating framework to use Vagrant blueprints to build and test projects like Drupal and Puppet modules'
    url='https://www.drupal.org/project/drush-vagrant'
    _package
}

_package() {
    cd $pkgname

    rm LICENSE.txt
    for doc in docs README.md; do
        [ -d "$doc" -o -f "$doc" ] && {
            install -dm755 "$pkgdir/usr/share/doc/$pkgname"
            cp -R "$doc" "$pkgdir/usr/share/doc/$pkgname/$doc"
        }
    done

    msg2 'Adding main files'
    install -m755 -d "$pkgdir/usr/share/drush/commands/$pkgname"
    cp -R . "$pkgdir/usr/share/drush/commands/$pkgname"
}
