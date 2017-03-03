# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=go-kbdgrab
pkgver=r8.a3bbb70
pkgrel=1
pkgdesc='Key grabber written in golang for cleaning your keyboard'
arch=(i686 x86_64)
url='https://github.com/tonylambiris/go-kbdgrab'
license=(BSD)
makedepends=(go go-bindata)
source=("git+https://github.com/tonylambiris/go-kbdgrab.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go"
}

build() {
	cd "${srcdir}/${pkgname}"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" make deps
	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -m755 -D kbdgrab "${pkgdir}"/usr/bin/kbdgrab
}
