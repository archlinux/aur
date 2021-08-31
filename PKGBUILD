# Maintainer: Christian Brassat <christian.brassat@gmail.com>
# Contributor: Mark Wagie <mark.wagie@tutanota.com>

pkgname=skeuos-gtk-theme-git
_pkgname=skeuos-gtk
pkgrel=1
pkgver=20210813.r0.g46ed276
pkgdesc="Light and dark colorful Gtk3.20+ theme"
url='https://github.com/daniruiz/skeuos-gtk'
arch=('any')
license=('GPL3')
makedepends=('git')
source=(git+https://github.com/daniruiz/${_pkgname}.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install

	for color in Black Blue Brown Cyan Green Grey Magenta Orange Red Teal Violet White Yellow; do
		cp -r Skeuos-${color}-Dark-GNOME_40/gnome-shell "$pkgdir"/usr/share/themes/Skeuos-${color}-Dark
		cp -r Skeuos-${color}-Light-GNOME_40/gnome-shell "$pkgdir"/usr/share/themes/Skeuos-${color}-Light
	done
}
