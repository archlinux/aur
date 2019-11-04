#! /bin/bash
#  Coding manual at: https://gitlab.com/es20490446e/aur-box/wikis/packaging

Name="aur-box"
provides=("aur" "aur-publisher" "${Name}")
conflicts=("aur" "aur-publisher" "${Name}")
replaces=("aur" "aur-publisher")
pkgname="${Name}"

arch=("x86_64")
pkgver=12
pkgrel=1

pkgdesc="Publishes software instantly to Arch Linuxes"
license=("GPL3")
url="https://gitlab.com/es20490446e/${Name}"

makedepends=("git")
depends=("commits-count-git" "silently")

source=("git+${url}.git")
md5sums=("SKIP")


pkgver () {
	cd "${Name}"
	git rev-list --count HEAD
}


package () {
	mkdir --parents "${pkgdir}/usr/bin"
	mkdir --parents "${pkgdir}/usr/share/man/man1"

	mv "${srcdir}/${Name}/assets/box" "${pkgdir}/usr/share/box"
	mv "${srcdir}/${Name}/assets/box.1" "${pkgdir}/usr/share/man/man1/box.1"
	ln --symbolic "/usr/share/box/_box" "${pkgdir}/usr/bin/box"

	find "${pkgdir}" -type d -exec chmod u=rwx,g=rx,o=rx {} \;
	find "${pkgdir}" -type f -exec chmod u=rw,g=r,o=r {} \;
	chmod u=rwx,g=rx,o=rx "${pkgdir}/usr/share/box/_box"
}

