# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: metzen <metzen@gmail.com>

pkgname=logmein-hamachi
pkgver=2.1.0.139
pkgrel=1
pkgdesc="A zero-configuration VPN service"
arch=("i686" "x86_64" "arm" "armv7h")
url="https://secure.logmein.com/AU/labs/#HamachiforLinux"
license=("custom")
conflicts=("hamachi")
replaces=("hamachi")
options=("!strip")
[ "${CARCH}" == "i686" ] && _filearch_=x86 && sha1sums=('d4f3ab04245e072ed828542a9bb86ed8f3166a83' '2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "x86_64" ] && _filearch_=x64 && sha1sums=('b237fc46ff0693141996132650d33074c2122089' '2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "arm" ] && _filearch_=armel && sha1sums=('0cfbde5c0dbb6d9c0993d355e0ebdffc3f755a52' '2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "armv7h" ] && _filearch_=armhf && sha1sums=('dbac338e60b13dd2b31ef4429846f5c31520cbba' '2b8052f91bb47beac1fdab0c0c455a36f8876671')

source=("https://secure.logmein.com/labs/${pkgname}-${pkgver}-${_filearch_}.tgz" "systemd")

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
	install -m 644 "${srcdir}"/systemd "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service

	# License
	ln -sf "/opt/${pkgname}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
