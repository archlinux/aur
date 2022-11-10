# Maintainer: Ícar N. S. <personal@icarns.xyz>
pkgname=gtuber-git
pkgver=r338.0467b55
pkgrel=1
pkgdesc="A C library to fetch media info from websites."
arch=(any)
url="https://github.com/Rafostar/gtuber"
license=('LGPL')
depends=('glib2' 'glibc' 'gobject-introspection' 'libsoup3' 'gstreamer>=1.20' 'gst-plugins-base>=1.20' 'json-glib' 'gtk-doc' 'libxml2')
makedepends=('git' 'gcc' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('gtuber::git+https://github.com/Rafostar/gtuber.git#branch=main')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    arch-meson . build
    meson compile -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
    meson install -C build --destdir "$pkgdir"	
}
