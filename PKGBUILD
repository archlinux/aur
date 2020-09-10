# Maintainer :  Cyberfee <deltax.fluxion@gmail.com>


pkgname=fluxion-git

epoch=1
pkgver() { git -C "${pkgname%-git}" describe --tags | sed 's/^v//;s/-/.r/;s/-g/./'; }
pkgver=4.10.r192.098715f
pkgrel=1

pkgdesc='Security auditing and social-engineering research tool'
url="https://fluxionnetwork.github.io/${pkgname-git}"
arch=('any')
license=('GPL3')

makedepends=('git')
depends=('bc' 'xterm' 'unzip' 'p7zip' 'openssl' 'net-tools' 'php-cgi' 'curl' 'dhcp' 'hostapd' 'lighttpd' 'iw' 'wireless_tools' 'nmap' 'dsniff' 'macchanger' 'aircrack-ng' 'cowpatty' 'mdk3' 'mdk4')
optdepends=('python: deauth-ng'
            'python-pyric: deauth-ng')

conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

install="${pkgname%-git}.install"
source=("git+https://github.com/FluxionNetwork/${pkgname/-/.}")
sha256sums=('SKIP')

options=('zipman')


prepare() { sed -i 1s/python2/python/ "${pkgname%-git}/attacks/Captive Portal/deauth-ng.py"; }

package() {
  cd "${pkgname%-git}"

  install -Dm755 "${pkgname%-git}.sh" -t"$pkgdir/usr/share/${pkgname%-git}/"
  cp -a --no-preserve=o attacks language lib logos misc preferences scripts "$pkgdir/usr/share/${pkgname%-git}/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname%-git}" <<-EOF
		#!/bin/sh

		cd /usr/share/${pkgname%-git}
		exec bash ${pkgname%-git}.sh "\$@"
	EOF

  install -Dm644 *.md -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 "docs/man/${pkgname%-git}.1" -t"$pkgdir/usr/share/man/man1/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
