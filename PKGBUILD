# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=1.8.0
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="http://syncthing.net/"
arch=('any')
license=('MPLv2')
provides=('syncthing=1.8.0')
conflicts=('syncthing')
install=${_realname}.install
source=( 'syncthing.1')
sha256sums=('fb59747ca16d1b19e3cad1c147dcabea14a30a5e4177b90712e6bb837c107912')
 

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha256sums+=('aeb3d8609920657aa5523974b33eb8a352e86d49ab08eaeb63a3967a83ebe39c')
		;;
	i686) _pkgarch="386"
		sha256sums+=('76ced8b7c67182719a7c2df032519caf44af9f0be84f90f74349357838afd41b')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('0abe7891d689edf5e148d257e4264e9764e4479cb935f53ccc2e3c07efc87bf0')
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
