# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac
pkgver=5.5.0
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=('any')
url="https://github.com/1995parham/${pkgname}"
license=('GPL2')
conflicts=("${pkgname}-bin" "${pkgname}-git")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('be42d6fdd631555e30a9b67f07b50b944c6cf88f5f89237c382ef78a0dbc698b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
