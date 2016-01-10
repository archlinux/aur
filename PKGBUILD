# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=0.12.12
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="http://syncthing.net/"
arch=('armv6h' 'i686' 'x86_64')
license=('MPLv2')
provides=('syncthing=0.12.12')
conflicts=('syncthing')
install=${_realname}.install
source=( 'syncthing.1')
sha1sums=('cabf3bf78457ce17057ae39fe3b0009a4aa446c4')
 

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha1sums+=('458e9f5f1a86eb2f6fbe48478cd1754dc08181fa')
		;;
	i686) _pkgarch="386"
		sha1sums+=('3e455e9093a6d041a90ee23a154493f70e66aa66')
		;;
	x86_64) _pkgarch="amd64"
		sha1sums+=('8505feb90e583f26942835fa8d82b7a3d09c0fbe')
		;;
esac

source+=("https://github.com/syncthing/${_realname}/releases/download/v${pkgver}/${_realname}-linux-${_pkgarch}-v${pkgver}.tar.gz")

package() {
    cd "${_realname}-linux-${_pkgarch}-v${pkgver}"
    install -D -m 755 ${_realname} "${pkgdir}/usr/bin/${_realname}"
    install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
    install -D -m 644 README.txt "${pkgdir}/usr/share/doc/${_realname}/README.md"
    install -D -m 644 "etc/linux-systemd/system/${_realname}@.service" \
                      "${pkgdir}/usr/lib/systemd/system/${_realname}@.service"
    install -D -m 644 "etc/linux-systemd/user/${_realname}.service" \
                      "${pkgdir}/usr/lib/systemd/user/${_realname}.service"
    install -D -m 644 "../${_realname}.1" "${pkgdir}/usr/share/man/man1/${_realname}.1"
}

# vim:set ts=2 sw=2 et:
