# Maintainer: Nils Czernia <nils[at]czserver[dot]de>
pkgname=moodle-plus
_pkgname=moodle
pkgver=3.0
_pkgver='latest-30'
pkgrel=1
pkgdesc='Moodle is a open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php' 'php-intl' 'php-gd')
conflicts=('moodle')
options=('!strip')
source=("https://download.moodle.org/stable30/moodle-${_pkgver}.tgz")
sha256sums=('fb73ddc3281b4b78a0e766edefb2568030e3cdf3fcdad70bc40b320ee81091c0')

package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps
    install -dm0755 var/lib/${_pkgname}
    cp -a "$srcdir"/${_pkgname} usr/share/webapps/${_pkgname}

    # move data in var
    ln -s ../../../var/lib/moodle usr/share/webapps/moodledata
    
    # fix rights and ownership
    chown -R http:http usr/share/webapps/${_pkgname}
    chown -R http:http var/lib/${_pkgname}
    chown -R http:http etc/webapps/${_pkgname}

    # php.ini
    install -dm0755 $pkgdir/etc/php/conf.d/
    echo 'open_basedir = ${open_basedir}:/usr/share/webapps/moodle:/usr/share/webapps/moodledata:/var/lib/moodle' > $pkgdir/etc/php/conf.d/${_pkgname}.ini
}
