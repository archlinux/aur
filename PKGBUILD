# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=0.12.23
pkgrel=2
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="http://syncthing.net/"
arch=('armv6h' 'i686' 'x86_64')
license=('MPLv2')
provides=('syncthing=0.12.23')
conflicts=('syncthing')
install=${_realname}.install
source=( 'syncthing.1')
sha256sums=('fb59747ca16d1b19e3cad1c147dcabea14a30a5e4177b90712e6bb837c107912')
 

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha256sums+=('4c7871b810678d6a0a32d52f291477bf1121becf761b860ade07d2184c94e51e')
		;;
	i686) _pkgarch="386"
		sha256sums+=('6b361d21ed2e407c61c35328b97616e318f56178a8d25e4a7cb0327e541ee1cf')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('e8c9f0a1f679bc49c3c1c64d748aed17864915b7e87109cad3f511ecb2a21682')
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
