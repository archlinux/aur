# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=jira-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Feature-rich interactive Jira command line."
arch=(x86_64)
url="https://github.com/ankitpokhrel/jira-cli"
license=('MIT')

makedepends=("go")

conflicts=('jira-cli-bin')
provides=('jira')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('50b9d4f86d26d2f3eb43a0eaa400d22ada4cbb5fb742f0ea0a9283c41089799c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/cmd/jira"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/cmd/jira"
	install -D -m755 jira ${pkgdir}/usr/bin/jira
}
