# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail.com>
pkgname=nemo-folder-icons
pkgver=3.0
pkgrel=4
pkgdesc='Nemo extension that makes changing folders icons easy!'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bilelmoussaoui/nautilus-folder-icons"
depends=('gobject-introspection' 'gtk3' 'nemo-python')
makedepends=('gnome-common' 'meson' 'appstream-glib')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bil-elmoussaoui/nautilus-folder-icons/archive/$pkgver.tar.gz")
sha256sums=('25fa6f164f50ed84ee6fa6d7a6004cb5190051847a5c3895f41bf1b426ad2565')

prepare() {
	cd "nautilus-folder-icons-$pkgver"
	find . -type f -exec sed -i 's%#!/usr/bin/python2%#!/usr/bin/python%g' {} \;
}

build() {
	cd "nautilus-folder-icons-$pkgver"
	arch-meson builddir -Dfile_manager=nemo
}

package() {
	cd "nautilus-folder-icons-$pkgver"
	DESTDIR="$pkgdir" ninja -C builddir install
}
