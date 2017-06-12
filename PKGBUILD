# Maintainer: Nils Czernia <nils[at]czserver[dot[de>
# Co-Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=moodle
pkgver=3.3
_pkgver='stable33'
pkgrel=1
pkgdesc='Moodle is a open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php' 'php-intl' 'php-gd')
conflicts=('moodle-plus')
options=('!strip')
source=("https://download.moodle.org/${_pkgver}/moodle-${pkgver}.tgz")
sha256sums=('d567c6899eb8aa5b25091dd486c396a6032726dbe27a6319e2a809423a0008d7')

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
    echo 'open_basedir = ${open_basedir}:/usr/share/webapps/moodle:/usr/share/webapps/moodledata:/var/lib/moodle' > $pkgdir/etc/php/conf.d/moodle.ini
}
