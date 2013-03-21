# Maintainer: Mark Grimes <mgrimes at peculier dot com>
# https://github.com/mvgrimes/aur-nagios-npre-plugin
# Contributor: Idares <idares@seznam.cz>

pkgname=nagios-nrpe-plugin
pkgver=2.14
pkgrel=1
pkgdesc="The Nagios NRPE server side plugin."
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.nagios.org"
source=("http://downloads.sourceforge.net/nagios/nrpe-${pkgver}.tar.gz")
md5sums=('105857720e21674083a6d6be99e102c7')
depends=(nagios)

build() {
    cd ${srcdir}/nrpe-${pkgver}
    ./configure --prefix=/usr/share/nagios \
        --with-nagios-user=nagios --with-nagios-group=nagios || return 1
    make || return 1
}

package() {
    cd ${srcdir}/nrpe-${pkgver}
    make prefix=${pkgdir}/usr/share/nagios install-plugin || return 1
}
