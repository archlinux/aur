# Inspired by existing AUR package browserpass-librewolf
# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>

_id=browserpass@maximbaz.com
pkgname=browserpass-cachy-browser
pkgver=3.7.2
pkgrel=2
pkgdesc="Cachy Browser extension for Browserpass, browser extension for zx2c4's pass (password manager)"
arch=('any')
url="https://github.com/browserpass/browserpass-extension"
license=('ISC')
depends=('cachy-browser')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3711209/browserpass-${pkgver}-fx.xpi"
	"https://raw.githubusercontent.com/browserpass/browserpass-extension/master/LICENSE")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('b1781405b46f3274697885b53139264dca2ab56ffc4435c093102ad5ebc59297'
	'88c5889f0ef1f64a5e08408b51ce47a991087966b1bf127ec0ec39c9d7111f50')

package() {
	install -Dm644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/cachy-browser/browser/extensions/${_id}.xpi"

	# Install host json from browserpass package
	install -dm755 "${pkgdir}/usr/lib/cachy-browser/native-messaging-hosts/"
	ln -sf "/usr/lib/browserpass/hosts/firefox/com.github.browserpass.native.json" "${pkgdir}/usr/lib/cachy-browser/native-messaging-hosts/"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
