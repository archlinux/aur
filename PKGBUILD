# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=('otf-rasa' 'ttf-rasa')
pkgbase=rasa-font
pkgver=1.002
pkgrel=1
pkgdesc='Serif font for continuous reading on the web (Gujarati included)'
arch=(any)
url="https://github.com/rosettatype/yrsa-rasa"
license=('OFL')
groups=('yrsa-rasa-fonts')
depends=('fontconfig' 'xorg-font-utils') # needed for pacman hooks
provides=('ttf-font')
source=("$pkgbase-$pkgver.zip::$url/releases/download/v$pkgver/Rasa-fonts-v$pkgver.zip")
sha256sums=('5a2e68bb130ad062ad2dc90be43b4c7c66e51a2d890f2372adbed290c271dd41')

_package() {
	cd Rasa
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

	# txt file is actually a Markdown file:
	install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_otf-rasa() {
	conflicts=('ttf-rasa')
	_package
	install -Dm644 -t "$pkgdir/usr/share/fonts/${pkgbase%-font}" otf/*.otf
}

package_ttf-rasa() {
	conflicts=('otf-rasa')
	_package
	install -Dm644 -t "$pkgdir/usr/share/fonts/${pkgbase%-font}" ttf/*.ttf
}
