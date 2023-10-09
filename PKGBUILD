# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname=aladdin-2fa-desktop-bin
pkgver=1.2.0.23
pkgrel=1
pkgdesc="2FA Push and OTP authenticator for JaCarta Authentication Server (JAS)"
arch=('x86_64')
url="https://aladdin-rd.ru"
license=('unknown')
options=('!strip' '!emptydirs')
source=("https://www.aladdin-rd.ru/upload/downloads/aladdin-2fa/aladdin-2fa-desktop-x64-$pkgver.deb")
sha512sums=('c1c5e4dbdd6851a6a39e8bba5d710e262a31589ed90d8a60886887dc65724b8a087c0cd91c07a718a0a0471069991dee96c4519b0c599a78d22589da20bc2427')

package() {
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/sbin/* usr/bin; rm -rf usr/sbin
	ls usr/share/applications/*.desktop | while read line; do
		sed -i s'|^Exec=/usr/sbin/|Exec=/usr/bin/|g' "$line"
	done

	cd ..
}
