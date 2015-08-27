# Maintainer: freaknils <nils@czserver.de>

pkgname=moodle-plus
pkgver=2.9.1
_pkgver='latest-29'
pkgrel=1
pkgdesc='Moodle is a open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php' 'php-intl' 'php-gd')
conflicts=('moodle')
options=('!sitrip')
source=("https://download.moodle.org/stable29/moodle-${_pkgver}.tgz")
d5sums=('1bebd9e60d741f0e510d1cef5057ba68')

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
