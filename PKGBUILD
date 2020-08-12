# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('palenight-gtk-theme' 'amarena-gtk-theme' 'gruvterial-gtk-theme')
pkgbase=material-gtk-framework
_pkgbase=gtk-theme-framework
pkgver=0.2.0
pkgrel=2
pkgdesc="GTK themes built with the GTK Theme Framework"
arch=('any')
url="https://github.com/jaxwilko/gtk-theme-framework"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
makedepends=('sassc' 'inkscape' 'optipng')
options=('!strip')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'git+https://github.com/vinceliuice/vimix-icon-theme.git')
sha256sums=('a94cb2d2934e61c8763905f3f974973b17fe30e5d7791c521ee0b0cf16bc907a'
            'SKIP')

prepare() {
	cd "$_pkgbase-$pkgver"
	if [[ ! -d src/icons/vimix-icon-theme ]]; then
		ln -s "$srcdir/vimix-icon-theme" src/icons/vimix-icon-theme
	fi
}

build() {
	cd "$_pkgbase-$pkgver"

	# Remove precompiled assets
	rm -rf dist

	./main.sh -vcf
	./main.sh -t amarena -vcf
	./main.sh -t gruvterial -vcf
}

package_palenight-gtk-theme() {
	cd "$_pkgbase-$pkgver"
	install -d "$pkgdir"/usr/share/{icons,themes}
	./main.sh -v -id "$pkgdir/usr/share/themes" \
		-op "$pkgdir/usr/share/icons"
}

package_amarena-gtk-theme() {
	cd "$_pkgbase-$pkgver"
	install -d "$pkgdir"/usr/share/{icons,themes}
	./main.sh -t amarena -v -id "$pkgdir/usr/share/themes" \
		-op "$pkgdir/usr/share/icons"
}

package_gruvterial-gtk-theme() {
	cd "$_pkgbase-$pkgver"
	install -d "$pkgdir"/usr/share/{icons,themes}
	./main.sh -t gruvterial -v -id "$pkgdir/usr/share/themes" \
		-op "$pkgdir/usr/share/icons"
}
