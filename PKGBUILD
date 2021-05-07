# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=1.16.1
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="http://syncthing.net/"
arch=('any')
license=('MPLv2')
provides=('syncthing=1.16.1')
conflicts=('syncthing')
install=${_realname}.install
source=( 'syncthing.1')
sha256sums=('fb59747ca16d1b19e3cad1c147dcabea14a30a5e4177b90712e6bb837c107912')
 

case "$CARCH" in
	arm64) _pkgarch="arm64"
		sha256sums+=('6e1a4839fe24555cf2c7fc10e8eefae1e5810ffd4bbaccbaf63986b7c7e5e357')
		;;
	armv*) _pkgarch="arm"
		sha256sums+=('a9c45c6af18c179874faf2e4f00f3aeb5ba66add132bc72f460ea5a8be7ba749')
		;;
	i686) _pkgarch="386"
		sha256sums+=('88852606067bdcdf8ac8e040df7c2c1fd80764ce5db9a26e3610ed92285dcf9b')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('b4801f62699946e6c695c01f436ae8ebd6e5c1f741d1176515890d6c0adf143d')
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
