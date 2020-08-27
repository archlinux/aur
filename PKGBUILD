# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('palenight-gtk-theme' 'amarena-gtk-theme' 'gruvterial-gtk-theme')
pkgbase=gtk-theme-framework
pkgver=0.2.1
pkgrel=1
pkgdesc="GTK themes built with the GTK Theme Framework"
arch=('any')
url="https://github.com/jaxwilko/gtk-theme-framework"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
makedepends=('sassc' 'inkscape' 'optipng')
conflicts=('material-gtk-framework')
replaces=('material-gtk-framework')
options=('!strip')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'git+https://github.com/vinceliuice/vimix-icon-theme.git')
sha256sums=('90fdab6c78b8cbb262cc9b99125a156bcdda1133f8d69a71d94b7ca6baae9fe9'
            'SKIP')

prepare() {
	cd "$pkgbase-$pkgver"
	if [[ ! -d src/icons/vimix-icon-theme ]]; then
		ln -s "$srcdir/vimix-icon-theme" src/icons/vimix-icon-theme
	fi
}

build() {
	cd "$pkgbase-$pkgver"

	# Remove precompiled assets
	rm -rf dist

	./main.sh -vcf
	./main.sh -t amarena -vcf
	./main.sh -t gruvterial -vcf
}

package_palenight-gtk-theme() {
	cd "$pkgbase-$pkgver"
	install -d "$pkgdir"/usr/share/{icons,themes}
	./main.sh -v -id "$pkgdir/usr/share/themes" \
		-op "$pkgdir/usr/share/icons"
}

package_amarena-gtk-theme() {
	cd "$pkgbase-$pkgver"
	install -d "$pkgdir"/usr/share/{icons,themes}
	./main.sh -t amarena -v -id "$pkgdir/usr/share/themes" \
		-op "$pkgdir/usr/share/icons"
}

package_gruvterial-gtk-theme() {
	cd "$pkgbase-$pkgver"
	install -d "$pkgdir"/usr/share/{icons,themes}
	./main.sh -t gruvterial -v -id "$pkgdir/usr/share/themes" \
		-op "$pkgdir/usr/share/icons"
}
