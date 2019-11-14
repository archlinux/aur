#! /bin/bash

Name="commits-count"
CamelName="commitsCount"
provides=("${Name}")
conflicts=("${Name}")
pkgname="${Name}-git"

arch=("any")
pkgver=5
pkgrel=1

pkgdesc="Shows the commits count of a project without having to clone it"
license=("GPL3")
url="https://gitlab.com/es20490446e/${Name}"

makedepends=("git")
depends=("curl")

source=("git+${url}.git")
md5sums=("SKIP")


pkgver () {
	cd "${Name}"
	git rev-list --count HEAD
}


package () {
	mkdir --parents "${pkgdir}/usr/bin"
	mkdir --parents "${pkgdir}/usr/share/man/man1"

	mv "${srcdir}/${Name}/assets/${CamelName}" "${pkgdir}/usr/share/${CamelName}"
	mv "${srcdir}/${Name}/assets/${CamelName}.1" "${pkgdir}/usr/share/man/man1/${CamelName}.1"
	ln --symbolic "/usr/share/${CamelName}/_${CamelName}" "${pkgdir}/usr/bin/${CamelName}"

	find "${pkgdir}" -type d -exec chmod u=rwx,g=rx,o=rx {} \;
	find "${pkgdir}" -type f -exec chmod u=rw,g=r,o=r {} \;
	chmod u=rwx,g=rx,o=rx "${pkgdir}/usr/share/${CamelName}/_${CamelName}"
}

