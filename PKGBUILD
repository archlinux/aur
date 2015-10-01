# Maintainer: Nils Czernia <nils[at]czserver[dot[de>
pkgname=moodle
pkgver=2.9.2
pkgrel=1
pkgdesc='Moodle is a open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php' 'php-intl' 'php-gd')
conflicts=('moodle-plus')
options=('!strip')
source=("https://download.moodle.org/stable29/moodle-${pkgver}.tgz")
md5sums=('f58c41a6acaaa76077928b86198b79bd')

package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps
    install -dm0755 var/lib/moodle
    cp -a "$srcdir"/$pkgname usr/share/webapps/moodle

    # move data in var
    ln -s ../../../var/lib/moodle usr/share/webapps/moodledata

    # fix rights and ownership
    chown -R http:http usr/share/webapps/moodle
    chown -R http:http var/lib/moodle

    # php.ini
    install -dm0755 $pkgdir/etc/php/conf.d/
    echo 'open_basedir = ${open_basedir}:/usr/share/webapps/moodle:/usr/share/webapps/moodledata:/var/lib/moodle' > $pkgdir/etc/php/conf.d/moodle.ini
}
