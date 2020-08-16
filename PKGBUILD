# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=tuf-manager
pkgver=1.2.1
pkgrel=1
pkgdesc="Program to control ASUS TUF laptop keyboard lighting and fan modes"
arch=("x86_64")
url="https://git.cromer.cl/cromer/tuf-manager"
license=("BSD3")
depends=("gtk3>=3.14" "glib2" "dbus-glib" "libnotify" "libappindicator-gtk3" "polkit"  "faustus-dkms-git")
makedepends=("meson" "ninja" "vala")
source=("https://git.cromer.cl/cromer/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('046a19f346fe4075130f979de2c5be30d08347bfab7c61179518d228729c927ef73aaa7e2818be76936bf332f81daa761b0a86cc74842b893a5aa4587ef50041')

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
