# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=xurls
pkgver=2.6.0
pkgrel=1
pkgdesc="Extract urls from plain text"
arch=('x86_64')
url="https://github.com/mvdan/${pkgname}"
license=('BSD-3-Clause')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('476d92a0416fee965f928180a950691b85dbb8d11efc3dc7f795ecc106c76075')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# disable vcs, otherwise -version picks up the git timestamp from the build env
	CGO_ENABLED=0 go build -buildvcs=false -trimpath -mod=readonly -modcacherw ./cmd/xurls
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" xurls
}
