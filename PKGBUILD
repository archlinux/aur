# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pony-initialisation
pkgver=1381025241
pkgrel=2
pkgdesc="System bootup scripts for sysvinit"
url="https://github.com/GNU-Pony/pony-initialisation"
arch=(any)
license=(GPL3)
backup=(etc/inittab etc/rc.conf etc/rc.local etc/rc.local.shutdown)
depends=(glibc bash coreutils iproute2 ncurses kbd findutils)
makedepends=("dhcpcd: DHCP network configuration"
	     "bridge-utils: Network bridging support"
	     "net-tools: Network support"
	     "wireless_tools: Wireless networking"
	     "sysvinit: SysV init support"
	     "systemd: new crypttab format support")
provides=(initscripts initscripts-fork)
conflicts=(initscripts initscripts-fork)
makedepends=(make coreutils grep sed asciidoc texinfo gzip)
install=pony-initialisation.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(56cfd3d3e13f0507d251c34079fc57f301e11934ff9ddecc9591798691a00c62)


build() {
	cd "${srcdir}/pony-initialisation-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX= LIBEXEC=/lib DATA=/usr/share info completion/{bash,zsh}-completion.install
}

package() {
	cd "${srcdir}/pony-initialisation-${pkgver}"
	make -j1 DESTDIR="${pkgdir}" PREFIX= LIBEXEC=/lib DATA=/usr/share install install_systemdcompatlayer install_all_daemons
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

