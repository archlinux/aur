# Maintainer :  Cyberfee <deltax.fluxion@gmail.com>


pkgname=fluxion-git

pkgver() { git -C "${pkgname%-git}" describe --tags | sed 's/^v//;s/-/.r/;s/-g/./'; }
pkgver=4.10.r198.5b0ef2b
pkgrel=1

pkgdesc='Security auditing and social-engineering research tool'
url="https://fluxionnetwork.github.io/${pkgname-git}"
arch=('any')
license=('GPL3')

makedepends=('git')
depends=('bc' 'xterm' 'unzip' 'p7zip' 'openssl' 'net-tools' 'php-cgi' 'curl' 'dhcp' 'hostapd' 'lighttpd' 'iw' 'wireless_tools' 'nmap' 'dsniff' 'macchanger' 'aircrack-ng' 'cowpatty' 'mdk3' 'mdk4')

conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

install="${pkgname%-git}.install"
source=("git+https://github.com/FluxionNetwork/${pkgname/-/.}")
sha256sums=('SKIP')

options=('zipman')


package() {
  cd "${pkgname%-git}"

  install -Dm755 "${pkgname%-git}.sh" -t"$pkgdir/usr/share/${pkgname%-git}/"
  cp -a --no-preserve=ownership attacks language lib logos misc scripts preferences "$pkgdir/usr/share/${pkgname%-git}"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname%-git}" <<-EOF
		#!/bin/sh

		cd /usr/share/${pkgname%-git}
		exec bash ${pkgname%-git}.sh "\$@"
	EOF

  install -Dm644 *.md -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 "docs/man/${pkgname%-git}.1" -t"$pkgdir/usr/share/man/man1/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
