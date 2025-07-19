# Maintainer: jensb <aur-jensb AT mailbox PUNKT org>

pkgname='spicetify-marketplace-bin'
pkgver=1.0.7
pkgrel=1
pkgdesc='Spicetify app that integrates a marketplace for extensions, themes and snippets'
arch=('any')
url='https://github.com/spicetify/spicetify-marketplace'
license=('MIT')
depends=('spicetify-cli')
makedepends=('git')
source=("spicetify-marketplace-v${pkgver}.zip::https://github.com/spicetify/spicetify-marketplace/releases/download/v${pkgver}/marketplace.zip"
		"color-v${pkgver}.ini::https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/color.ini"
		"LICENSE-v${pkgver}::https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/LICENSE")
sha256sums=('61af9d12a99e95e225e16d5eea4abfeaa3beccf7047c5dc58f323ffa8a4fca2d'
            '802c83f4f822eb254f60ef34ea8c53ea9d97889b9e886ac532e42953b9548fb2'
            '49ecb1c6db038200e2f9e8549d99d1966dcfa5b4bc3d0aea3e89b2f3a305a6da')
install=spicetify-marketplace-bin.install

package() {
	# color.ini needed for custom themes to work according to https://github.com/spicetify/spicetify-marketplace/wiki/Installation#manual-install-recommended
	install -Dm644 color-v$pkgver.ini "$pkgdir/opt/spicetify-cli/Themes/marketplace/color.ini"
	install -Dm644 LICENSE-v$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd marketplace-dist
    find . -type f -not -name "README.md" -exec install -Dm644 {} $pkgdir/opt/spicetify-cli/CustomApps/marketplace/{} \;
}
