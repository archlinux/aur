# Contributor: Tonich <tonich-chuvack@mail.ru>

pkgname=openrc-xdm
pkgver=1.0.1
pkgrel=1
pkgdesc="OpenRC display manager init script"
arch=('i686' 'x86_64')
url="https://github.com/DemonSinusa/openrc-xdm"
license=('GPL2')
provides=('openrc-xdm' 'init-displaymanager')
depends=('xorg-server' 'xorg-xinit' 'openrc')
backup=( etc/openrc/conf.d/xdm )

conflicts=('init-displaymanager')
source=($pkgname-$pkgver::https://github.com/DemonSinusa/$pkgname/archive/$pkgver.tar.gz)
install=openrc-xdm.install
sha256sums=('a36c1c2df0b09c48b030f2815226c1b4d929bbeeba4188c4e0d5a85da2905a6d')

_inst_initd(){
    install -Dm755 "$1.initd" "${pkgdir}/etc/openrc/init.d/$1"
}

_inst_confd(){
    install -Dm755 "$1.confd" "${pkgdir}/etc/openrc/conf.d/$1"
}


package() {
	cd "${pkgname}-${pkgver}"
    _inst_confd 'xdm'
    _inst_initd 'xdm'
    _inst_initd 'xdm-setup'

    install -Dm755 "startDM.sh" "${pkgdir}/etc/X11/startDM.sh"
}
