# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>

_id=browserpass@maximbaz.com
pkgname=browserpass-librewolf
pkgver=3.9.0
pkgrel=1
pkgdesc="Librewolf extension for Browserpass, browser extension for zx2c4's pass (password manager)"
arch=('any')
url="https://github.com/browserpass/browserpass-extension"
license=('ISC')
depends=('browserpass')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/4406417/browserpass-${pkgver}-fx.xpi"
        "https://raw.githubusercontent.com/browserpass/browserpass-extension/master/LICENSE")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('514c1a606d7bc82045d21bcbc6e5b1e5007446ab32aa01f0f17fbe0bde03ef0c'
            '88c5889f0ef1f64a5e08408b51ce47a991087966b1bf127ec0ec39c9d7111f50')

package() {
	install -Dm644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/librewolf/browser/extensions/${_id}.xpi"

	# Install host json from browserpass package
	install -dm755 "${pkgdir}/usr/lib/librewolf/native-messaging-hosts/"
	ln -sf "/usr/lib/browserpass/hosts/firefox/com.github.browserpass.native.json" "${pkgdir}/usr/lib/librewolf/native-messaging-hosts/"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

