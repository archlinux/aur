# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=go-kbdgrab
pkgver=r24.b10f98f
pkgrel=1
pkgdesc='Key grabber written in golang for cleaning your keyboard'
arch=(i686 x86_64)
url='https://github.com/tonylambiris/go-kbdgrab'
license=(BSD)
makedepends=(go)
source=("git+https://github.com/tonylambiris/go-kbdgrab")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/tonylambiris/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/tonylambiris/go-kbdgrab"
}

build() {
	cd "${srcdir}/go/src/github.com/tonylambiris/go-kbdgrab"

	export GOPATH="${srcdir}/go"
	export PATH="${PATH}:${GOPATH}/bin"

	make
}

package() {
	cd "${srcdir}/go/src/github.com/tonylambiris/go-kbdgrab"

	install -m755 -D kbdgrab "${pkgdir}"/usr/bin/kbdgrab
}
