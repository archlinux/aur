# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=0.11.18
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="http://syncthing.net/"
arch=('armv6h' 'i686' 'x86_64')
license=('MPLv2')
provides=('syncthing=0.11.18')
conflicts=('syncthing')
install=${_realname}.install
source=( 'syncthing.1')
sha1sums=('cabf3bf78457ce17057ae39fe3b0009a4aa446c4')
 

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha1sums+=('ab4c77193d680f6b053f130cd1af6c4ca7944513')
		;;
	i686) _pkgarch="386"
		sha1sums+=('cb02ef96f984c32717f42d2223320c9c2bd263e0')
		;;
	x86_64) _pkgarch="amd64"
		sha1sums+=('c31bbc8f7a92e95fb70d4a1473519552b2dba348')
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
