# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=1.19.0
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="http://syncthing.net/"
arch=('any')
license=('MPLv2')
provides=('syncthing=1.19.0')
conflicts=('syncthing')
install=${_realname}.install
source=( 'syncthing.1')
sha256sums=('fb59747ca16d1b19e3cad1c147dcabea14a30a5e4177b90712e6bb837c107912')
 

case "$CARCH" in
	arm64) _pkgarch="arm64"
		sha256sums+=('70b7beb9e09ecb87e814537555e8b6c34b6de904155dcc6efa5467903a009f90')
		;;
	armv*) _pkgarch="arm"
		sha256sums+=('19dbef6417a8c6f5d0362d38c7e294f45d82d0ed925656e51653d9f9087512b3')
		;;
	i686) _pkgarch="386"
		sha256sums+=('ebd8f35c9d14c94072da4fe302a3abc01987b94ef6b3e3272b8a1e20a0871570')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('c493cef18e5b3c540bb220252f09f14e3363458653de248bb79796f0f9e612db')
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
    install -D -m 644 "etc/linux-sysctl/30-${_realname}.conf" \
                      "${pkgdir}/usr/lib/sysctl.d/30-${_realname}.conf"
    install -D -m 644 "etc/firewall-ufw/${_realname}" \
                      "${pkgdir}/etc/ufw/applications.d/ufw-${_realname}"
}

# vim:set ts=2 sw=2 et:
