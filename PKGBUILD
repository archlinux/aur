# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Surefire <surefire at cryptomile dot net>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>
# Contributor: Frikilinux <frikilinux at gmail dot com>

pkgname=gnome-shell-extension-appindicator-git
pkgver=59+2+g557dbdd
pkgrel=1
epoch=1
pkgdesc='AppIndicator/KStatusNotifierItem support for GNOME Shell'
url='https://github.com/ubuntu/gnome-shell-extension-appindicator'
license=('GPL-2.0-or-later')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
depends=('gnome-shell>=3.34')
makedepends=(
  'git'
  'jq'
  'meson'
)
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//; s/-/+/g'
}

build() {
	arch-meson "${pkgname}" build -Dlocal_install=disabled
	meson compile -C build
}

package() {
	meson install -C build --destdir="${pkgdir}"
	# this file is generated at pkg install time
	rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
