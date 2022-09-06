# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeaudit
pkgver=0.20.0
pkgrel=1
pkgdesc="kubeaudit is a command line tool and a Go package to audit Kubernetes clusters for various different security concerns."
makedepends=('go')
arch=('x86_64')
conflicts=('kubeaudit-bin')
url="https://github.com/Shopify/kubeaudit"
license=('MIT')
source=("https://github.com/Shopify/kubeaudit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('352a1c9d3d3a2492da8ab4ab20b19185f2277112821eb72c3aa06cd1c10c6c4e')

build() {
	cd "${pkgname}-${pkgver}"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"${LDFLAGS}\"" \
		-o kubeaudit \
		cmd/main.go
}

package() {
	cd "${pkgname}-${pkgver}"
	install -D -m755 kubeaudit -t "${pkgdir}/usr/bin"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
