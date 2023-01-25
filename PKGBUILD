# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: metzen <metzen@gmail.com>

pkgname=logmein-hamachi
pkgver=2.1.0.203
pkgrel=1
pkgdesc="A zero-configuration VPN service"
url="https://www.vpn.net/linux"
arch=("x86_64")
license=("custom")
conflicts=("hamachi")
replaces=("hamachi")
options=("!strip")
source=("https://vpn.net/installers/${pkgname}-${pkgver}-x64.tgz"
        "${pkgname}.service")
sha256sums=('67d4e845a28b118112ed3bc1d0ae8f84898c640e988a2ac8d38e31dcf697c07f'
            'b32e32f2c98519b469a660f7459eeb12f454767bcec0f5edf8ae6bd89eef3dba')

package() {
	cd ${pkgname}-${pkgver}-x64

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
