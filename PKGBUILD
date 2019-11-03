#! /bin/bash

Name="execute"
provides=("${Name}" "batman")
conflicts=("${Name}" "batman")
pkgname="${Name}-git"

pkgdesc="Opens exe and bat files as if they were native"
url="https://gitlab.com/es20490446e/exeCute"
license=("GPL3")

pkgver=1
pkgrel=1
arch=("x86_64")

makedepends=("git")
depends=("dosbox" "q4wine" "wine_gecko" "wine-mono")
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


build () {
	cd "${srcdir}"
	git clone "${url}.git"
}

package () {
	"${srcdir}/exeCute/installer" "-install" "${pkgdir}"
}

