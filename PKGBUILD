# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail.com>
pkgname=nemo-folder-icons
_gitname=nautilus-folder-icons
pkgver=3.0
pkgrel=7
pkgdesc='Nemo extension that makes changing folders icons easy!'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bilelmoussaoui/nautilus-folder-icons"
depends=('gtk3' 'nemo-python')
makedepends=('meson')
#checkdepends=('appstream-glib')
conflicts=('nemo-ext-git' 'nemo-compare')
            # See https://github.com/bilelmoussaoui/nautilus-folder-icons/issues/34
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('25fa6f164f50ed84ee6fa6d7a6004cb5190051847a5c3895f41bf1b426ad2565')

prepare() {
	cd "$_gitname-$pkgver"
	find . -type f -exec sed -i 's|#!/usr/bin/python2|#!/usr/bin/python|g' {} \;
}

build() {
	arch-meson "$_gitname-$pkgver" build -Dfile_manager=nemo
	meson compile -C build
}

# unitteststest_utils.py & Validate appdata file fails
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
