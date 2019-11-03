#! /bin/bash

Name="execute"
pkgname="${Name}-git"
pkgrel=1
pkgdesc="Opens exe and bat files as if they were native"
arch=("x86_64")
url="https://gitlab.com/es20490446e/exeCute"
license=("GPL3")
makedepends=("git")
depends=("dosbox" "q4wine" "wine_gecko" "wine-mono")
provides=("${Name}" "batman")
conflicts=("${Name}" "batman")
source=()
md5sums=()


pkgver() {
	local numbers='^[0-9]+$'

	local version=$(
		curl --silent "${url}" |
		grep "Commits</a>" |
		cut --delimiter='>' --fields=7 |
		cut --delimiter='<' --fields=1
	)

	if ! [[ ${version} =~ ${numbers} ]] ; then
		echo "Invalid version: ${version}" >&2
		exit 1
	else
		echo "${version}"
	fi
}
pkgver=$(pkgver)


build () {
	cd "${srcdir}"
	git clone "${url}.git"
}

package () {
	"${srcdir}/exeCute/installer" "-install" "${pkgdir}"
}

