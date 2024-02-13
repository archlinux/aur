# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=moodle
pkgver=4.3.3
_pkgver="stable403"
pkgrel=1
pkgdesc='An open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php>=8.0' 'php-intl>=8.0' 'php-gd>=8.0' 'mariadb>=10.6.7' 'php-sodium>=8.0')
conflicts=('moodle-plus')
options=('!strip')
source=("https://download.moodle.org/download.php/direct/${_pkgver}/${pkgname}-${pkgver}.tgz")
sha256sums=('c85ac3dbbedb3b6e4ee46797546e1584a3bfa07f5db20aa84ecae5319a171db2')


package() {
    install -dm0755 "${pkgdir}"/usr/share/webapps
    install -dm0755 "${pkgdir}"/var/lib/${pkgname}
    cp -a $pkgname "$pkgdir/usr/share/webapps/${pkgname}"

    # move data in var
    ln -s /var/lib/${pkgname} "$pkgdir"/usr/share/webapps/moodledata
    
    # fix rights and ownership
    # should be handled differently
    chown -R http:http "${pkgdir}"/var/lib/${pkgname}

    # php.ini
    install -dm0755 "$pkgdir"/etc/php/conf.d/
}
