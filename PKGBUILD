# Maintainer: Ivan Sosnov <ivanmsosnov@gmail.com>

pkgbase=plasma5-themes-apus-git
pkgname=(plasma5-themes-apus-git)
_pkgname=apus
pkgver=r31.0b3b23a
pkgrel=1
pkgdesc="A dark lilac theme for KDE Plasma desktop"
arch=(any)
url="https://gitlab.com/jomada/$_pkgname"
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	provides=('plasma5-themes-apus')
	optdepends=(
		'latte-dock: Custom Plasma dock'
		'kate: KDE text editor'
		'konsole: KDE terminal emulator'
	)
	cd $_pkgname

	# Window Decorations
	install -d "$pkgdir"/usr/share/aurorae/themes
	cp -r aurorae/Apus "$pkgdir"/usr/share/aurorae/themes

	# Color Schemes
	install -d "$pkgdir"/usr/share/color-schemes
	install -Dm0644 -t "$pkgdir"/usr/share/color-schemes $(find . -type f -name 'Apu*.colors')

	# Plasma Appearance
	install -d "$pkgdir"/usr/share/plasma/look-and-feel
	cp -r global/Apus "$pkgdir"/usr/share/plasma/look-and-feel

	# Plasma Global Theme
	install -d "$pkgdir"/usr/share/plasma/desktoptheme
	cp -r Apus "$pkgdir"/usr/share/plasma/desktoptheme

	# Optional Latte layout
	install -d "$pkgdir"/usr/share/latte/layout
	cp Latte-layout/Apus.layout.latte "$pkgdir"/usr/share/latte/layout
	echo "An optional Latte-dock layout has been installed into /usr/share/latte/layout. It can be manually imported from this directory"

	# Konsole Theme
	install -Dm0644 -t "$pkgdir"/usr/share/konsole $(find . -type f -name 'Apu*.colorscheme')

	# Kate Theme
	install -Dm0644 -t "$pkgdir"/usr/share/org.kde.syntax-highlighting/themes $(find . -type f -name 'Apu*.theme')

	# Wallpapers
	install -d "$pkgdir"/usr/share/wallpapers
	cp -r wallpaper/ApusColors "$pkgdir"/usr/share/wallpapers

	# Misc
	install -Dm0644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
