# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-gtk
pkgver=1.0.1
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
source=("https://code.as/writeas/writeas-gtk/archive/v${pkgver}.tar.gz")
sha256sums=('be97a35012cee110911bda517a87ed8a8ad1ce1634a8960b11b565449470245f')

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
