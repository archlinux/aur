# Maintainer: Mark Wagie <mark.wagie at tutanota dot com>
# Contributor: toluschr <toluschr at protonmail dot com>
pkgname=('yaru-colors-gtk-theme-git'
         'yaru-colors-icon-theme-git'
         'yaru-colors-wallpapers-git')
pkgbase='yaru-colors-gtk-theme-git'
pkgver=2.0.r13.3ac6559
pkgrel=1
pkgdesc="A fork of Ubuntu's Yaru theme - in different colors"
arch=('any')
license=('GPL3')
url="https://github.com/Jannomag/Yaru-Colors"
makedepends=('git')
source=('git+https://github.com/Jannomag/Yaru-Colors.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/Yaru-Colors"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package_yaru-colors-gtk-theme-git() {
	depends=('gtk3' 'gdk-pixbuf2' 'gtk-engine-murrine' 'gnome-themes-extra' 'gnome-shell')
	optdepends=('yaru-colors-wallpapers' 'yaru-colors-icon-theme' 'yaru-sound-theme')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/Yaru-Colors"
	install -d "$pkgdir/usr/share/themes"
	cp -a Themes/* "$pkgdir/usr/share/themes"
}

package_yaru-colors-icon-theme-git() {
	depends=('hicolor-icon-theme' 'gtk-update-icon-cache' 'librsvg' 'humanity-icon-theme')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/Yaru-Colors"
	install -d "$pkgdir/usr/share/icons"
	cp -a Icons/* "$pkgdir/usr/share/icons"
}

package_yaru-colors-wallpapers-git() {
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/Yaru-Colors"
	install -d "$pkgdir/usr/share/backgrounds/yaru-colors"
	cp -a Wallpapers/* "$pkgdir/usr/share/backgrounds/yaru-colors"
}
