# Maintainer: bemxio <bemxiov at protonmail dot com>

_pkgname=xcat
pkgname="${_pkgname}-git"

pkgdesc="A command line tool to XOR a data stream with a given key"

pkgver=r2.d92ce2e
pkgrel=2

arch=(any)

url="https://github.com/mstrand/xcat"
#license=("LicenseRef-unknown")

depends=(python)
makedepends=(git)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
  	# move to the source directory
	cd "${_pkgname}"

	# use the number of revisions since beginning of the history
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	# move to the source directory
	cd "${_pkgname}"

	# copy the script to the package
	install -Dm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}