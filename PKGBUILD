# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeaudit
pkgver=0.22.2
pkgrel=1
pkgdesc="A command line tool and a Go package to audit Kubernetes clusters for various different security concerns."
makedepends=('go')
arch=('x86_64')
conflicts=('kubeaudit-bin')
url="https://github.com/Shopify/kubeaudit"
license=('MIT')
source=("https://github.com/Shopify/kubeaudit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90752d42c4d502ab6776af3358ae87a02d2893fc2bb7a0364d6c1fdcd8ff0570')

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
