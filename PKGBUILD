# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=jira-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Feature-rich interactive Jira command line."
arch=(x86_64)
url="https://github.com/ankitpokhrel/jira-cli"
license=('MIT')

makedepends=("go")

conflicts=('jira-cli-bin' 'go-jira' 'go-jira-bin')
provides=('jira')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('7181903db8cbc44a514c4c374d952b964e49ba9dfc866fbe90cef24ea2e2009a')

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
