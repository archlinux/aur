# Maintainer: Ivan Sosnov <ivanmsosnov@gmail.com>

pkgbase=plasma5-themes-apus-git
pkgname=(plasma5-themes-apus-git)
_pkgname=apus
pkgver=r13.1d5850c
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
	optdepends=('latte-dock: Custom Plasma dock')
	cd $_pkgname

	install -d "$pkgdir"/usr/share

	echo "Unpacking theme..."
	rm README.md
	mkdir -p plasma/desktoptheme
	mkdir -p aurorae/themes
	mkdir -p latte-layouts
	mv Apus plasma/desktoptheme/Apus
	mv Latte-layout latte-layouts

	cp -r color-schemes "$pkgdir"/usr/share
	cp -r konsole "$pkgdir"/usr/share
	cp -r plasma "$pkgdir"/usr/share
	cp -r wallpaper "$pkgdir"/usr/share
	cp -r aurorae "$pkgdir"/usr/share
	cp -r latte-layouts "$pkgdir"/usr/share
}
