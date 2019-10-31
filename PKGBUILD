#! /bin/bash
#  Coding manual at: https://gitlab.com/es20490446e/aur-publisher/-/wiki_pages/packaging

Name="aur-publisher"
provides=("aur" "${Name}")
conflicts=("aur" "${Name}")
replaces=("aur")
pkgname="${Name}-git"

arch=("x86_64")
pkgver=r11.1411290
pkgrel=1

pkgdesc="Publishes software instantly to Arch Linuxes"
license=("GPL3")
url="https://gitlab.com/es20490446e/${Name}"

makedepends=("git")
depends=("curl" "silently")

source=("git+${url}.git")
md5sums=("SKIP")


pkgver () {
	cd "${Name}"
	printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package () {
	mkdir --parents "${pkgdir}/usr/bin"
	mkdir --parents "${pkgdir}/usr/share/man/man1"

	mv "${srcdir}/${Name}/assets/aur" "${pkgdir}/usr/share/${Name}"
	mv "${srcdir}/${Name}/assets/aur.1" "${pkgdir}/usr/share/man/man1/aur.1"
	ln --symbolic "/usr/share/${Name}/_aur" "${pkgdir}/usr/bin/aur"

	find "${pkgdir}" -type d -exec chmod u=rwx,g=rx,o=rx {} \;
	find "${pkgdir}" -type f -exec chmod u=rw,g=r,o=r {} \;
	chmod u=rwx,g=rx,o=rx "${pkgdir}/usr/share/${Name}/_aur"
}

