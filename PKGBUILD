# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
_name=gnome-tour
pkgname=$_name-git
pkgver=0.0.1.r5.g92c75f1
pkgrel=1
pkgdesc="A guided tour and greeter for GNOME"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/$_name"
license=('GPL')
depends=(gtk3)
makedepends=(appstream-glib rust meson git)
conflicts=($_name)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd $_name
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson $_name build \
		-Ddistro_name='Arch Linux' \
		-Ddistro_icon_name='archlinux'  \
		-Ddistro_version=' '  # rolling release, no version
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
