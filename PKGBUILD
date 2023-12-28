# Maintainer: jensb <aur-jensb AT mailbox PUNKT org>

pkgname='spicetify-marketplace-bin'
pkgver=0.9.4
pkgrel=2
pkgdesc='Spicetify app that integrates a marketplace for extensions, themes and snippets'
arch=('any')
url='https://github.com/spicetify/spicetify-marketplace'
license=('MIT')
depends=('spicetify-cli')
makedepends=('git')
source=('https://github.com/spicetify/spicetify-marketplace/releases/download/v'$pkgver'/spicetify-marketplace.zip'
		'https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/color.ini'
		'https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/LICENSE')
sha256sums=('42716a98b7e6da0225ec9dc4db148f12ac9ba4659cfbd28831551584fe956104'
            '802c83f4f822eb254f60ef34ea8c53ea9d97889b9e886ac532e42953b9548fb2'
            '49ecb1c6db038200e2f9e8549d99d1966dcfa5b4bc3d0aea3e89b2f3a305a6da')
install=spicetify-marketplace-bin.install

package() {
	# color.ini needed for custom themes to work according to https://github.com/spicetify/spicetify-marketplace/wiki/Installation#manual-install-recommended
	install -Dm644 color.ini $pkgdir/usr/share/spicetify-cli/Themes/marketplace/color.ini
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd spicetify-marketplace-dist
    find . -type f -not -name "README.md" -exec install -Dm644 {} $pkgdir/usr/share/spicetify-cli/CustomApps/marketplace/{} \;
}
