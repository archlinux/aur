# Maintainer: Tomoghno Sen <tomoghno@outlook.com>
pkgname=('manjaro-mate-theme-git'
		'manjaro-mate-wallpaper-git')
pkgbase='manjaro-mate-theme-git'
pkgver=2.0.r1.g38c0553
pkgrel=1
pkgdesc="Yaru MATE Theme for Manjaro/Arch"
arch=('any')
license=('GPL3')
url="https://github.com/Tomoghno/Manjaro-MATE-Theme"
makedepends=('git')
options=('!strip')
source=('git+https://github.com/Tomoghno/Manjaro-MATE-Theme.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/Manjaro-MATE-Theme"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_manjaro-mate-theme-git() {
	depends=('gtk3' 'gnome-themes-extra')
	optdepends=('gdk-pixbuf2: GTK2 support'
	            'gtk-engine-murrine: GTK2 support'
	            'manjaro-mate-wallpaper: Matching wallpapers')
	provides=("${pkgname%}")
	conflicts=("${pkgname%}")

	cd "$srcdir/Manjaro-MATE-Theme"
	install -d "$pkgdir/usr/share/themes"
	cp -a Themes/* "$pkgdir/usr/share/themes"
}

package_manjaro-mate-wallpaper-git() {
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/Manjaro-MATE-Theme"
	install -d "$pkgdir/usr/share/backgrounds/manjaro-mate"
	cp -a Wallpaper/* "$pkgdir/usr/share/backgrounds/manjaro-mate"
}

