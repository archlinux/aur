# maintainer: revectane <revectane@proton.me> irc: Revectane (irc.libera.chat)
pkgname=win10fonts-auto
pkgver=0.1
pkgrel=1
pkgdesc="replacement for broken ttf-ms-win10/11-fonts pkgs. saw this in a comment section of said pkgs and said why not make a pkgbuild."
arch=(any)
license=(GPL-2.0-only)
depends=('wget' '7zip')

package() {
	wget https://archive.org/download/windows-10-22h2-en-us/Windows%2010%2022H2%20x86%20en-us.iso
	7z e "Windows 10 22H2 x86 en-us.iso" sources/install.esd
	7z e install.esd 1/Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} -ofonts/

	install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 fonts/*.ttf fonts/*.ttc

	rm "Windows 10 22H2 x86 en-us.iso"
}
