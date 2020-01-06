# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-gtk
pkgver=1.0.6
pkgrel=1
pkgdesc='Write.as GTK desktop app'
arch=('x86_64')
url='https://write.as/apps/desktop'
license=('GPL3')
depends=(
	'gtksourceview3'
)
makedepends=(
	'meson'
	'ninja'
	'vala'
)
optdepends=(
	'writeas-cli: web publishing support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/writeas/writeas-gtk/archive/v${pkgver}.tar.gz")
sha256sums=('32e515692807c640825b4ba05328b30b4a52b62232f9e6b3a05d65254e19b0a6')

prepare() {
	# The build was failing across versions of meson, so always clean build.
	# Why would anyone use a build system that breaks itself when you update it
	# and requires so much detailed knowledge of how it works to get anything
	# done?
	rm -rf "${srcdir}/build"
	mkdir -p build
}

build() {
	arch-meson "${pkgname}" build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja install -C build
}
