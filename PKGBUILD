# Maintainer: jensb <aur-jensb AT mailbox PUNKT org>

pkgname='spicetify-marketplace-bin'
pkgver=0.9.3
pkgrel=1
pkgdesc='Spicetify app that integrates a marketplace for extensions, themes and snippets'
arch=('any')
url='https://github.com/spicetify/spicetify-marketplace'
license=('MIT')
depends=('spicetify-cli'
         'spotify')
makedepends=('git')
source=('https://github.com/spicetify/spicetify-marketplace/releases/download/v'$pkgver'/spicetify-marketplace.zip'
		'https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/color.ini'
		'https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/LICENSE')
sha256sums=('3a3f5bac7a7f9c7c7e5b88b056962f575f574412160f4cec8b1c781e3e36e7d6'
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
