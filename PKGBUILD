# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-provision
_pkgname=provision
pkgver=3.0_alpha2
pkgrel=1
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush')
source=("http://ftp.drupal.org/files/projects/${_pkgname}-7.x-${pkgver/_/-}.tar.gz")
md5sums=('b386baee2c276c9e4cbf84142ba3d336')


package() {
    cd $_pkgname

    msg2 'Purging unwanted files'
    rm -r debian
    rm LICENSE.txt
    rm upgrade.sh.txt
    rm release.sh

    msg2 'Adding doc files'
    install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
    mv -t "${pkgdir}/usr/share/doc/${pkgname}/examples" example example.sudoers
    mv -t "${pkgdir}/usr/share/doc/${pkgname}" HACKING_2x.mdwn *.txt
    find "${pkgdir}/usr/share/doc/${pkgname}" -type f -exec chmod 0644 {} +
    find "${pkgdir}/usr/share/doc/${pkgname}" -type d -exec chmod 0755 {} +

    msg2 'Adding main files'
    install -m755 -d "${pkgdir}/usr/share/webapps/drush/commands/${_pkgname}"
    mv * "${pkgdir}/usr/share/webapps/drush/commands/${_pkgname}"
    find "${pkgdir}/usr/share/webapps/drush/commands/${_pkgname}" -type f -exec chmod 0644 {} +
    find "${pkgdir}/usr/share/webapps/drush/commands/${_pkgname}" -type d -exec chmod 0755 {} +
}
