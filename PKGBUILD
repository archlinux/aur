# Maintainer: Kevin Gravier<kevin@mrkmg.com>
pkgname=nativescript-sidekick
pkgver=1.19.1.v.2019.11.18.2
pkgrel=1
pkgdesc="NativeScript Sidekick is a desktop GUI that enhances the power of the NativeScript CLI and simplifies the development of mobile applications. It is designed to be a companion that complements your code editor, source control, and any other tools you use."
arch=('x86_64')
url="https://www.nativescript.org"
license=('custom')
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("$pkgname-$pkgver.deb::https://sk-cdn.nativescript.cloud/fusion/1.19.2-v.2019.11.18.2/linux/NativeScriptSidekick__amd64.deb"
		       "launcher1.patch")
sha512sums_x86_64=('5fd369b13bafeccf8ff582201312deabe58609ae39b73458a8d5a3d992c73503aa80659e286357827971a6428b48d299e65361d074d5595cb1b91b54f259bb63'
                   '8b642295d5a6bb07a98cbdd15cbfd71789fa9a2ac7ed0819ad0002f13c2a771a90e870e748e33e9a8322e2eaaac75d65a63705c408318ddff63b29d5bdbb12de')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	mv "${pkgdir}/opt/NativeScript Sidekick" "${pkgdir}/opt/NativeScriptSidekick"
	#mv "${pkgdir}/opt/NativeScriptSidekick/NativeScript Sidekick" "${pkgdir}/opt/NativeScriptSidekick/NativeScriptSidekick"
	#mv "${pkgdir}/usr/share/applications/NativeScript Sidekick.desktop" "${pkgdir}/usr/share/applications/NativeScriptSidekick.desktop"
	patch "${pkgdir}/usr/share/applications/NativeScriptSidekick.desktop" < launcher1.patch
	find "${pkgdir}/usr/share/icons/hicolor" -type f -name 'NativeScript Sidekick.png' | while IFS= read -r f; do mv -i "$f" "$(dirname "$f")/NativeScriptSidekick.png" ; done
	install -d "${pkgdir}/${pkgname}/opt"
	install -d "${pkgdir}/${pkgname}/usr/share"
}
