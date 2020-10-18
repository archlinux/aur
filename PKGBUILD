# Maintainer: Fernando Barrientos <fernando.barrientos57@gmail.com>
pkgname="wifymosys"
pkgver=0.25
pkgrel=1
pkgdesc="Evil Twin Attack Bash script"
arch=("x86_64")
url="https://github.com/Vodker/wifimosys"
license=("GPL-3.0")
depends=("aircrack-ng" "curl" "dhcp" "hostapd" "wireless_tools" "lighttpd" "macchanger" "mdk3" "php-cgi" "pyrit" "python" "unzip" "xterm")
source=(${pkgname}::git+https://github.com/Vodker/wifimosys)

package() {
	cd ${pkgname}
	install -d "${pkgdir}/opt/${pkgname}"
	cp -ra --no-preserve=owner . "${pkgdir}/opt/${pkgname}"
	chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}"
	rm -r "${pkgdir}/opt/${pkgname}/.git"
	install -d "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
/opt/wifymosys/wifimosys
EOF
	chmod 755 "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	return 0
}
md5sums=('SKIP')
