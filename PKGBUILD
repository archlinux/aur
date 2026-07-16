# maintainer: revectane <revectane@proton.me> irc: Revectane (irc.libera.chat)
pkgname=win10fonts-auto
pkgver=0.1
pkgrel=1
pkgdesc="replacement for broken ttf-ms-win10/11-fonts pkgs. saw this in a comment section of said pkgs and said why not make a pkgbuild."
arch=(any)
source=('https://archive.org/download/windows-10-22h2-en-us/Windows%2010%2022H2%20x86%20en-us.iso')
sha256sums=('764427989289fa221fb80b0f8f1c3411ad2e05761daa683a67da1a4100dbe1d8')
license=(custom)
depends=('7zip')

package() {
	7z e "Windows%2010%2022H2%20x86%20en-us.iso" sources/install.esd
	7z e install.esd 1/Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} -ofonts/

	install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 fonts/*.ttf fonts/*.ttc
	install -Dm644 fonts/license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}
