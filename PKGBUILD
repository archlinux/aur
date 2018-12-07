# Maintainer: Rafli Akmal <rafliakmaltejakusuma@gmail.com>
# Contributor: artoo <artoo@artixlinux.org>
# Contributor: Oscar Campos <damnwidget@artixlinux.org>

pkgname=vmware-openrc
pkgver=20181207
pkgrel=0
pkgdesc="OpenRC vmware init script"
arch=('any')
url="https://github.com/artix-linux/packages-galaxy"
license=('GPL2')
groups=('openrc-galaxy')
provides=('openrc-vmware')
depends=('openrc' 'vmware-workstation')
conflicts=('systemd-sysvcompat')
source=("vmware.initd")
md5sums=('fc873a8f04cc9c67813f370484df0b21')

# pkgver() {
# 	date +%Y%m%d
# }

_inst_initd(){
    install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

    sed -e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|g' \
        -e 's|/var/run|/run|g' \
        -e 's|/usr/sbin|/usr/bin|g' \
        -i ${pkgdir}/etc/init.d/$1
}

package() {
    _inst_initd 'vmware'
}
