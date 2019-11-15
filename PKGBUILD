#! /bin/bash

pkgname="aur-box"
provides=("${pkgname}")
conflicts=("${pkgname}")

pkgver=18
pkgrel=1
arch=("any")

pkgdesc="Publishes software instantly to Arch Linuxes"
url="https://gitlab.com/es20490446e/${pkgname}"
license=("GPL3")

makedepends=("git")
depends=("silently")
source=("git+${url}.git")
md5sums=("SKIP")


pkgver () {
	cd "${pkgname}"
	git rev-list --count HEAD
}


package () {
	mkdir --parents "${pkgdir}/usr/bin"
	mkdir --parents "${pkgdir}/usr/share/man/man1"

	cp --recursive "${srcdir}/${pkgname}/assets/box" "${pkgdir}/usr/share/box"
	cp "${srcdir}/${pkgname}/assets/box.1" "${pkgdir}/usr/share/man/man1/box.1"
	ln --symbolic "/usr/share/box/_box" "${pkgdir}/usr/bin/box"

	find "${pkgdir}" -type d -exec chmod u=rwx,g=rx,o=rx {} \;
	find "${pkgdir}" -type f -exec chmod u=rw,g=r,o=r {} \;
	chmod u=rwx,g=rx,o=rx "${pkgdir}/usr/share/box/_box"
}

