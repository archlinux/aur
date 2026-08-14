# maintainer: revectane <revectane@proton.me> irc: Revectane (irc.libera.chat)
pkgname=win11fonts-auto
pkgver=0.1
pkgrel=1
pkgdesc="replacement for broken ttf-ms-win10/11-fonts pkgs. saw this in a comment section of said pkgs and said why not make a pkgbuild."
arch=(any)
source=('https://software-static.download.prss.microsoft.com/dbazure/888969d5-f34g-4e03-ac9d-1f9786c66749/26100.1742.240906-0331.ge_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso')
sha256sums=('755a90d43e826a74b9e1932a34788b898e028272439b777e5593dee8d53622ae')
license=(custom)
depends=('7zip')

package() {
	7z e "26100.1742.240906-0331.ge_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso" sources/install.wim
	7z e install.wim Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} -ofonts/

	install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 fonts/*.ttf fonts/*.ttc
	install -Dm644 fonts/license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}
