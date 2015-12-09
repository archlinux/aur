# Maintainer: Mark Grimes <mgrimes at peculier dot com>
# Contributor: Idares <idares@seznam.cz>
# https://github.com/mvgrimes/aur-nagios-npre-plugin

pkgname=nagios-nrpe-plugin
pkgver=2.15
pkgrel=5
pkgdesc="The Nagios Server NRPE plugin (install on the monitoring machine)."
license=('GPL')
arch=('any')
url="http://www.nagios.org"
source=("http://downloads.sourceforge.net/nagios/nrpe-${pkgver}.tar.gz")
md5sums=('3921ddc598312983f604541784b35a50')
depends=(nagios)
install=nagios-nrpe-plugin.install

build() {
    cd ${srcdir}/nrpe-${pkgver}
    ./configure  --prefix=/usr/share/nagios \
        --with-nagios-user=nagios --with-nagios-group=nagios || return 1
    make || return 1
}

package() {
    cd ${srcdir}/nrpe-${pkgver}
    make prefix=${pkgdir}/usr/share/nagios install-plugin || return 1
}
