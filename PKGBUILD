# Maintainer: Gaetan Bisson <gaetan@fenua.org>

pkgname=timeliner-git
_pkgname=timeliner
pkgver=20191213.b54071f
pkgrel=1
pkgdesc='Personal data aggregation utility'
url='https://github.com/mholt/timeliner'
license=('AGPL')
arch=('x86_64')
makedepends=('git' 'go')
source=('git+https://github.com/mholt/timeliner.git')
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	go get -v -d
}

build() {
	cd "${srcdir}/${_pkgname}"
	go build -v -o timeliner cmd/timeliner/main.go
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -D -m 0755 timeliner "${pkgdir}/usr/bin/timeliner"
}
