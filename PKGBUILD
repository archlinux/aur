# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeaudit
pkgver=0.11.6
pkgrel=1
pkgdesc="kubeaudit is a command line tool and a Go package to audit Kubernetes clusters for various different security concerns."
makedepends=('go')
arch=('x86_64')
conflicts=('kubeaudit-bin')
url="https://github.com/Shopify/kubeaudit"
license=('MIT')
source=("https://github.com/Shopify/kubeaudit/archive/v${pkgver}.tar.gz")
sha256sums=('12d948da1789087286219b40e439f9688ed37918150e78381b2e1d820512b036')

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
