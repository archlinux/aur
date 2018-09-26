# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gomplate-git
pkgver=r612.9c851ec3
pkgrel=1
pkgdesc='A flexible commandline tool for template rendering.'
arch=(i686 x86_64)
url='https://gomplate.hairyhenderson.ca/'
license=(BSD)
makedepends=(go)
source=("${pkgname}::git+https://github.com/hairyhenderson/gomplate.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/hairyhenderson/"
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/hairyhenderson/gomplate"
}

build() {
	cd "${srcdir}/go/src/github.com/hairyhenderson/gomplate"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" make
}

package() {
	cd "${srcdir}/go/src/github.com/hairyhenderson/gomplate"

	install -m755 -D bin/gomplate "${pkgdir}"/usr/bin/gomplate
}
