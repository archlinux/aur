# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=pkgcloud-git
pkgver=r63.b0bbd28
pkgrel=1
pkgdesc="Talk to the packagecloud API, in Go"
arch=(x86_64)
url='https://github.com/tonylambiris/pkgcloud'
license=(Apache)
makedepends=(git go)
source=("${pkgname}::git+https://github.com/tonylambiris/pkgcloud.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${srcdir}/go/src/github.com/tonylambiris"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/tonylambiris/pkgcloud"
}

build() {
	cd "${srcdir}/go/src/github.com/tonylambiris/pkgcloud"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	make
}

package() {
	cd "${srcdir}/go/src/github.com/tonylambiris/pkgcloud"

	install -Dm755 "bin/pkgcloud" "${pkgdir}/usr/bin/pkgcloud"
}
