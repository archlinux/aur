# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=orchis-theme-git
pkgver=2021.01.22.r0.ge1f2908
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK based desktop environments."
arch=('any')
url="https://www.pling.com/p/1357889"
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk3' 'gnome-themes-extra')
makedepends=('git')
optdepends=('kvantum-theme-orchis: Matching Kvantum theme'
            'tela-circle-icon-theme: Recommended icon theme'
            'plank: for Plank theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Orchis-theme.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/share/themes"
    ./install.sh -t all -d "$pkgdir/usr/share/themes"

    install -Dm755 src/plank/dock.theme -t "$pkgdir/usr/share/plank/themes/Orchis"
    install -Dm644 src/wallpaper/*.jpg -t \
    	"$pkgdir/usr/share/backgrounds/${pkgname%-git}"
	install -d "$pkgdir/usr/share/doc/${pkgname%-git}/firefox"
	cp -r src/firefox/* "$pkgdir/usr/share/doc/${pkgname%-git}/firefox"
}
