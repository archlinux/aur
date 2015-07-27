# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=0.11.17
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="http://syncthing.net/"
arch=('armv6h' 'i686' 'x86_64')
license=('MPLv2')
provides=('syncthing=0.11.17')
conflicts=('syncthing')
install=${_realname}.install
source=( 'syncthing.1')
sha1sums=('cabf3bf78457ce17057ae39fe3b0009a4aa446c4')
 

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha1sums+=('1f0b2e9bb81c5d90222207dfd181e462f124a0f5')
		;;
	i686) _pkgarch="386"
		sha1sums+=('0048bcbabb4271578ab6768de25f80b1b276ffe9')
		;;
	x86_64) _pkgarch="amd64"
		sha1sums+=('eaa98044fbc6f0ba6f70fdbfdfd904e14ee625c5')
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
