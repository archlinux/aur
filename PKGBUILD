# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-provision
_pkgname=provision
pkgver=2.1
pkgrel=2
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush')
source=("http://ftp.drupal.org/files/projects/${_pkgname}-6.x-${pkgver}.tar.gz")
md5sums=('83d3022e6cbf36ecdc7733dec308d427')

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
    install -m755 -d "${pkgdir}/usr/share/drush/commands/${_pkgname}"
    mv * "${pkgdir}/usr/share/drush/commands/${_pkgname}"
    find "${pkgdir}/usr/share/drush/commands/${_pkgname}" -type f -exec chmod 0644 {} +
    find "${pkgdir}/usr/share/drush/commands/${_pkgname}" -type d -exec chmod 0755 {} +
}
