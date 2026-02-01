# Contributor: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=moodle
pkgver=5.0.1
pkgrel=1
pkgdesc='An open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php>=8.1' 'php-intl>=8.1' 'php-gd>=8.1' 'mariadb>=10.6.7' 'php-sodium>=8.1')
conflicts=('moodle-plus')
options=('!strip')
source=(https://download.moodle.org/download.php/direct/stable${pkgver//./}/moodle-latest-${pkgver//./}.tgz)
sha256sums=('3221eb1cb94d6e81a679f9c5c2cfe702a14bf8197100416bab0cc5587e8a922a')

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
