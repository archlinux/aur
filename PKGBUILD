# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: metzen <metzen@gmail.com>

pkgname=logmein-hamachi
pkgver=2.1.0.198
pkgrel=1
pkgdesc="A zero-configuration VPN service"
url="https://www.vpn.net/linux"
arch=("i686" "x86_64" "arm" "armv7h")
license=("custom")
conflicts=("hamachi")
replaces=("hamachi")
options=("!strip")
[ "${CARCH}" == "i686" ] && _filearch_=x86 && sha1sums=('4070960416602dc805400c080e53bee3794d5a13' '2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "x86_64" ] && _filearch_=x64 && sha1sums=('235806bf8eecf79da054ffe253150772c677c73c' '2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "arm" ] && _filearch_=armel && sha1sums=('24efae6a1255763b2fe9f6fa08ab8e9594c6bf8b' '2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "armv7h" ] && _filearch_=armhf && sha1sums=('2c9055351e77f45a20be9ebf989ead23567e21b0' '2b8052f91bb47beac1fdab0c0c455a36f8876671')

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
	install -m 755 uninstall.sh "${pkgdir}"/opt/${pkgname}
	install -m 444 README "${pkgdir}"/opt/${pkgname}
	install -m 444 LICENSE "${pkgdir}"/opt/${pkgname}
	install -m 444 CHANGES "${pkgdir}"/opt/${pkgname}
	ln -sf "/opt/${pkgname}/bin/hamachid" "${pkgdir}"/usr/bin/hamachi
	install -m 644 "${srcdir}"/${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service

	# License
	ln -sf "/opt/${pkgname}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
