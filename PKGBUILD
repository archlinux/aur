# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=go-kbdgrab
pkgver=r11.34cc0df
pkgrel=2
pkgdesc='Key grabber written in golang for cleaning your keyboard'
arch=(i686 x86_64)
url='https://github.com/tonylambiris/go-kbdgrab'
license=(BSD)
makedepends=(go go-bindata-new-git)
source=("git+https://github.com/tonylambiris/go-kbdgrab.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/tonylambiris/"
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/tonylambiris/"
}

build() {
	cd "${srcdir}/go/src/github.com/tonylambiris/go-kbdgrab"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" make
}

package() {
	cd "${srcdir}/go/src/github.com/tonylambiris/go-kbdgrab"

	install -m755 -D kbdgrab "${pkgdir}"/usr/bin/kbdgrab
}
