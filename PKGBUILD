# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gomplate-git
_pkgname=gomplate
pkgver=r680.b7670b8e
pkgrel=1
pkgdesc='A flexible commandline tool for template rendering.'
arch=(i686 x86_64)
url='https://gomplate.hairyhenderson.ca/'
license=(BSD)
makedepends=(go)
source=("${_pkgname}::git+https://github.com/hairyhenderson/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/hairyhenderson/"
	#cp -a "${srcdir}/${_pkgname}" "${srcdir}/go/src/github.com/hairyhenderson/gomplate"
	ln -sf "${srcdir}/${_pkgname}" "${srcdir}/go/src/github.com/hairyhenderson/${_pkgname}"
}

build() {
	cd "${srcdir}/go/src/github.com/hairyhenderson/${_pkgname}"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" make
}

package() {
	cd "${srcdir}/go/src/github.com/hairyhenderson/${_pkgname}"

	install -m755 -D bin/gomplate "${pkgdir}"/usr/bin/gomplate
}
