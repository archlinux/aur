# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=0.13.4
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="http://syncthing.net/"
arch=('armv6h' 'i686' 'x86_64')
license=('MPLv2')
provides=('syncthing=0.13.4')
conflicts=('syncthing')
install=${_realname}.install
source=( 'syncthing.1')
sha256sums=('fb59747ca16d1b19e3cad1c147dcabea14a30a5e4177b90712e6bb837c107912')
 

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha256sums+=('c01872d5885bb1a2fb7d7c54ef1df98e298dd79ba26f693d30a7fc4093c6f79e')
		;;
	i686) _pkgarch="386"
		sha256sums+=('48823d48732867b2384b74a8674fc0080b766cee35c4e9296008b609fb01e6af')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('5c7fa4facb044d4c91e7e2f0340615a6a1bc28217784fe94099f27d1f94a2a74')
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
