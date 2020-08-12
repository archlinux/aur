# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('palenight-gtk-theme' 'amarena-gtk-theme' 'gruvterial-gtk-theme')
pkgbase=material-gtk-framework
pkgver=0.1.10
pkgrel=1
pkgdesc="Material GTK themes built with the Material GTK Framework"
arch=('any')
url="https://github.com/JaxWilko/material-gtk-framework"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
makedepends=('sassc' 'inkscape' 'optipng')
options=('!strip')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'git+https://github.com/vinceliuice/vimix-icon-theme.git')
sha256sums=('e3e3bdc23325474f6ec241eb496e8247d1c8198fa3fce71cf9a9c6c335c49bda'
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
