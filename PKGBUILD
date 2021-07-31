# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac
pkgver=4.1.1
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=('any')
url="https://github.com/1995parham/${_pkgname}"
license=('GPL2')

makedepends=("go")

conflicts=("${pkgname}-bin" "${pkgname}-git")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('10895e9455953c6b5b240f9ea805ff6f8975aeac87f97a3163d100e74fb54531')

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
