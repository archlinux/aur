# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=moodle
pkgver=4.4.1
_pkgver="stable404"
pkgrel=2
pkgdesc='An open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php>=8.1' 'php-intl>=8.1' 'php-gd>=8.1' 'mariadb>=10.6.7' 'php-sodium>=8.1')
conflicts=('moodle-plus')
options=('!strip')
source=("https://download.moodle.org/download.php/direct/${_pkgver}/${pkgname}-${pkgver}.tgz")
sha256sums=('fa9cc3ad2326f95e291337b5de627f7b285ac5cbe7986fde9e8d1cb024538ac5')


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
