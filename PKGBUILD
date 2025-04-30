#Maintainer：	Giteeajake <giteeajake@qq.com>
#Thanks Klaus

pkgname="ghex-git"
_appname="ghex"
pkgver=48.alpha.r38.gb7c79111
pkgrel=1
pkgdesc='a hex editor for the GNOME desktop'
url='https://gitlab.gnome.org/GNOME/ghex'
_app_website='https://wiki.gnome.org/Apps/Ghex'
arch=('x86_64' 'aarch64')
license=('GPL-2.0-or-later')
source=("git+$url.git")
sha256sums=('SKIP')
provides=('ghex')
conflicts=('ghex')
depends=('gtk4' 'libadwaita')
makedepends=('itstool' 'gobject-introspection' 'git' 'meson' 'ninja')

pkgver() {
	cd "${srcdir}/${_appname}"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_appname}"
	meson setup -Dprefix=/usr build
	meson compile -C build
}

package() {
	cd "${srcdir}/${_appname}"
	meson install -C build --destdir "$pkgdir"
}
