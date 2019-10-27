#! /bin/bash
#  Coding manual at: https://gitlab.com/es20490446e/aur/wikis/packaging

Name="aur"
provides=("${Name}")
conflicts=("${Name}")
pkgname="${Name}-git"

arch=("x86_64")
pkgver=r2.8ceece5
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

	mv "${srcdir}/${Name}/assets/${Name}" "${pkgdir}/usr/share/${Name}"
	mv "${srcdir}/${Name}/assets/${Name}.1" "${pkgdir}/usr/share/man/man1/${Name}.1"
	ln --symbolic "/usr/share/${Name}/_${Name}" "${pkgdir}/usr/bin/${Name}"

	find "${pkgdir}" -type d -exec chmod u=rwx,g=rx,o=rx {} \;
	find "${pkgdir}" -type f -exec chmod u=rw,g=r,o=r {} \;
	chmod u=rwx,g=rx,o=rx "${pkgdir}/usr/share/${Name}/_${Name}"
}

