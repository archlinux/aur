# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=xurls
pkgver=2.5.0
pkgrel=1
pkgdesc="Extract urls from plain text"
arch=('x86_64')
url="https://github.com/mvdan/${pkgname}"
license=('BSD-3-Clause')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('552779a765de29e51ff01fe6c85a7d0389faae1b80d354332e7c69db232ee4ad')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# disable vcs, otherwise -version picks up the git timestamp from the build env
	CGO_ENABLED=0 go build -buildvcs=false -trimpath -mod=readonly -modcacherw ./cmd/xurls
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" xurls
}
