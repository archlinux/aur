# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail.com>
pkgname=nautilus-folder-icons
pkgver=3.0
pkgrel=6
pkgdesc='Nautilus extension that makes changing folders icons easy!'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bilelmoussaoui/nautilus-folder-icons"
depends=('gobject-introspection' 'gtk3' 'python-nautilus')
makedepends=('gnome-common' 'meson')
#checkdepends=('appstream')
conflicts=('nautilus-ext-git')
            # See https://github.com/bilelmoussaoui/nautilus-folder-icons/issues/34
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('25fa6f164f50ed84ee6fa6d7a6004cb5190051847a5c3895f41bf1b426ad2565')

prepare() {
	cd "$pkgname-$pkgver"
	find . -type f -exec sed -i 's|#!/usr/bin/python2|#!/usr/bin/python|g' {} \;
}

build() {
	cd "$pkgname-$pkgver"
	arch-meson builddir -Dfile_manager=nautilus
	ninja -C builddir
}

#check() {
#	cd "$pkgname-$pkgver"
#	ninja test -C builddir
#}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C builddir install
}
