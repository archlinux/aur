# Maintainer: Nils Czernia <nils[at]czserver[dot[de>
# Co-Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=moodle
pkgver=3.4
_pkgver='stable34'
pkgrel=1
pkgdesc='Moodle is a open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php' 'php-intl' 'php-gd')
conflicts=('moodle-plus')
options=('!strip')
source=("https://download.moodle.org/${_pkgver}/moodle-${pkgver}.tgz")
sha256sums=('06888238944d951009f19d2705c2fe8ed64fe6f5e526310f52646a4129612277')

package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps
    install -dm0755 var/lib/${pkgname}
    cp -a "$srcdir"/$pkgname usr/share/webapps/${pkgname}

    # move data in var
    ln -s ../../../var/lib/${pkgname} usr/share/webapps/moodledata
    
    # fix rights and ownership
    chown -R http:http usr/share/webapps/${pkgname}
    chown -R http:http var/lib/${pkgname}

    # php.ini
    install -dm0755 $pkgdir/etc/php/conf.d/
}
