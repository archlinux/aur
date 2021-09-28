# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=tuf-manager
pkgver=1.2.3
pkgrel=1
pkgdesc="Program to control ASUS TUF laptop keyboard lighting and fan modes"
arch=("x86_64")
url="https://git.cromer.cl/cromer/tuf-manager"
license=("BSD3")
depends=("gtk3>=3.14" "glib2" "dbus-glib" "libnotify" "libappindicator-gtk3" "polkit"  "faustus-rublag-dkms-git")
makedepends=("meson" "ninja" "vala")
source=("https://git.cromer.cl/cromer/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('525bc9fd7768b0de15ae643bf325a745da969506d59c52865ccbbaee30c21bfa385c5ce2fd614c502b25708f20dc8ddfea960a17179280e99d93c5de5ad2bc95')

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
	rm "${pkgdir}"/usr/share/glib-2.0/schemas/gschemas.compiled
}
