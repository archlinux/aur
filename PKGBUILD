# Maintainer :  Cyberfee <deltax.fluxion@gmail.com>


pkgname=fluxion-git
_name="${pkgname%-git}"

epoch=1
pkgver() { git -C "$_name" describe --tags | sed 's/^v//;s/-/.r/;s/-g/./'; }
pkgver=4.10.r215.f1d2b8a
pkgrel=3

pkgdesc='Security auditing and social-engineering research tool'
url="https://github.com/${_name}network/$_name"
arch=('any')
license=('GPL3')

conflicts=("$_name")
provides=("$_name")

makedepends=('git')
depends=('bc' 'xterm' 'unzip' 'p7zip' 'openssl' 'net-tools' 'php-cgi' 'curl' 'dhcp' 'hostapd' 'lighttpd'
         'iw' 'wireless_tools' 'nmap' 'dsniff' 'macchanger' 'aircrack-ng' 'cowpatty' 'mdk3' 'mdk4')
optdepends=('python: deauth-ng'
            'python-pyric: deauth-ng')

install="$_name.install"
source=("git+$url.git")
sha256sums=('SKIP')

options=('zipman')


prepare() { sed -i 1s/python2/python/ "$_name/attacks/Captive Portal/deauth-ng.py"; }

package() {
  cd "$_name"
  install -Dm755 "$_name.sh" -t"$pkgdir/usr/share/$_name/"
  cp -a --no-preserve=o attacks language lib logos misc preferences scripts "$pkgdir/usr/share/$_name/"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_name" <<-EOF
		#!/bin/sh
		cd /usr/share/$_name
		exec bash $_name.sh "\$@"
	EOF
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 "docs/man/$_name.1" -t"$pkgdir/usr/share/man/man1/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
