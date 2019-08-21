# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: metzen <metzen@gmail.com>

pkgname=logmein-hamachi
pkgver=2.1.0.203
pkgrel=1
pkgdesc="A zero-configuration VPN service"
url="https://www.vpn.net/linux"
arch=("i686" "x86_64" "arm" "armv7h")
license=("custom")
conflicts=("hamachi")
replaces=("hamachi")
options=("!strip")
[ "${CARCH}" == "i686" ] && _filearch_=x86 && sha1sums=('2f95d8258dad9e2c8cc6006af1857c124d2b8e08' '2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "x86_64" ] && _filearch_=x64 && sha1sums=('72deff7d0a8ea22b6ff306967ab20ecdbce76e63' '2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "arm" ] && _filearch_=armel && sha1sums=('e71ad02ae2f39d84d05bb46dcb11db57f1748026' '2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "armv7h" ] && _filearch_=armhf && sha1sums=('8639443a9f223cce1b4a82708eb2b190718ee781' '2b8052f91bb47beac1fdab0c0c455a36f8876671')

source=("https://www.vpn.net/installers/${pkgname}-${pkgver}-${_filearch_}.tgz" "${pkgname}.service")

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}-${_filearch_}

	# Directories
	install -d "${pkgdir}"/opt/${pkgname}/bin
	install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/systemd/system
	install -d "${pkgdir}"/usr/share/licenses/${pkgname}

	# Files
	install -m 755 hamachid "${pkgdir}"/opt/${pkgname}/bin
	install -m 755 dnsup "${pkgdir}"/opt/${pkgname}/bin
	install -m 755 dnsdown "${pkgdir}"/opt/${pkgname}/bin
	install -m 444 README "${pkgdir}"/opt/${pkgname}
	install -m 444 LICENSE "${pkgdir}"/opt/${pkgname}
	install -m 444 CHANGES "${pkgdir}"/opt/${pkgname}
	ln -sf "/opt/${pkgname}/bin/hamachid" "${pkgdir}"/usr/bin/hamachi
	install -m 644 "${srcdir}"/${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service

	# License
	ln -sf "/opt/${pkgname}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
