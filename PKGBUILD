# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=cri-o
pkgver=1.8.0
pkgrel=1
pkgdesc='Open Container Initiative-based implementation of Kubernetes Container Runtime Interface'
arch=(i686 x86_64)
url='https://github.com/kubernetes-incubator/cri-o'
license=(Apache)
makedepends=(go go-md2man ostree)
source=("git+https://github.com/kubernetes-incubator/cri-o")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"

	git checkout "v${pkgver}"

	install -m755 -d "${srcdir}/go/src/github.com/kubernetes-incubator"

	cp -a "${srcdir}/${pkgname}" \
		"${srcdir}/go/src/github.com/kubernetes-incubator/cri-o"
}

build() {
	cd "${srcdir}/go/src/github.com/kubernetes-incubator/cri-o"

	GOPATH="${srcdir}/go" make -j1
}

package() {
	cd "${srcdir}/go/src/github.com/kubernetes-incubator/cri-o"

	GOPATH="${srcdir}/go" make PREFIX="${pkgdir}" install
}
