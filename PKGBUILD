#Maintainer:        Mumi Jim <echo "=02bj5yav9Gb0V3bA1Waq9VatVXb" | rev | base64 -d>
# a funny project

pkgname="akizip-git"
_appname="AkiZip"
pkgver=0.4.0.r0.g377a1cdc
pkgrel=1
pkgdesc='A modern archive manager for the Linux desktop.'
url='https://github.com/AkiZip/AkiZip'
_app_website='https://www.akizip.top/'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
source=("git+$url.git")
sha256sums=('SKIP')
depends=('7zip' 'cairo' 'dconf' 'gtk4' 'hicolor-icon-theme' 'libadwaita' 'python-gobject' 'pango')
makedepends=('gettext' 'git' 'gobject-introspection' 'meson' 'ninja' 'pkgconf')

pkgver() {
	cd "${srcdir}/${_appname}"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_appname}"
	arch-meson . build
	meson compile -C build
}

package() {
	cd "${srcdir}/${_appname}"
	meson install -C build --destdir "$pkgdir"
}
