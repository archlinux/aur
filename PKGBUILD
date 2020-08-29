# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=tuf-manager
pkgver=1.2.2
pkgrel=1
pkgdesc="Program to control ASUS TUF laptop keyboard lighting and fan modes"
arch=("x86_64")
url="https://git.cromer.cl/cromer/tuf-manager"
license=("BSD3")
depends=("gtk3>=3.14" "glib2" "dbus-glib" "libnotify" "libappindicator-gtk3" "polkit"  "faustus-rublag-dkms-git")
makedepends=("meson" "ninja" "vala")
source=("https://git.cromer.cl/cromer/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7e11f616770586db414d8c96c20a53f0d09f9a3b12cbea305f4a68d5d33d8fda8c509c5e584487c63b693e353f06b815193c0dbf73a86a4b68f498f555659089')

prepare() {
	[ -d "${srcdir}"/build ] && rm -rf build
	mkdir "${srcdir}"/build
}

build() {
	cd "${srcdir}"/build
	meson "${srcdir}/${pkgname}" \
		--prefix=/usr \
		--libexecdir=/usr/lib
	ninja
}

package() {
	cd "${srcdir}"/build
	DESTDIR="${pkgdir}" ninja install
}
