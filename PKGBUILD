# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=jira-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="Feature-rich interactive Jira command line."
arch=(x86_64)
url="https://github.com/ankitpokhrel/jira-cli"
license=('MIT')

makedepends=("go")

conflicts=('jira-cli-bin' 'go-jira' 'go-jira-bin')
provides=('jira')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('c076d3c263619a4f8efaaa06dfc9cb4c709a106523c04dd056713711497cbe6f')

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
