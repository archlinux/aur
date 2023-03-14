# Maintainer: Siôn le Roux <sion@leroux.hu>

pkgname="gnome-thumbnailers-git"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgver=r23.6d695f6
pkgrel=1
pkgdesc="Thumbnailing utilities for 3D files for GNOME 42+"
arch=(any)
url="https://github.com/rcarmo/gnome-thumbnailers"
license=('MIT')
depends=('python')
makedepends=('git')
optdepends=('xorg-server-xvfb: OpenSCAD support'
			'openscad: OpenSCAD support'
			'imagemagick: OpenSCAD support'
			'blender: Blender support')
source=("${pkgname}::git+${url}.git"
		"no-stl.patch")
md5sums=('SKIP'
		'f28a407987f6c319552ebf3d7fa19d5b')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
	patch -p1 -i "$srcdir/no-stl.patch"
}

package() {
	mkdir -p "${pkgdir}/usr/local/bin"
	cp "$srcdir/${pkgname}"/*_thumbnailer "${pkgdir}/usr/local/bin"
	mkdir -p "${pkgdir}/usr/share/thumbnailers"
	cp "$srcdir/${pkgname}"/*.thumbnailer "${pkgdir}/usr/share/thumbnailers"
}
