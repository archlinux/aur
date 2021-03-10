# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=moodle
pkgver=3.10.2
_pkgver="stable310"
pkgrel=1
pkgdesc='An open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php7>=7.2.0' 'php-intl>=7.2.0' 'php-gd>=7.2.0' 'mariadb>=10.2.29')
conflicts=('moodle-plus')
options=('!strip')
source=("https://download.moodle.org/${_pkgver}/${pkgname}-${pkgver}.tgz")
sha256sums=('b36d06b70a95d41015af6abe0f11ba86a2a70ea3347559ba4dba2498f0bc1ebb')


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
