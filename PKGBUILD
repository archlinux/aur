# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac
pkgver=5.5.1
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=('any')
url="https://github.com/1995parham/${pkgname}"
license=('GPL2')
conflicts=("${pkgname}-bin" "${pkgname}-git")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8637de7e549b3a74a0d74181701fe9d46c83a7a626e3336ee2eb8b16b837f15e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
	go build \
			-trimpath \
			-buildmode=pie \
			-mod=readonly \
			-modcacherw \
			-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
			.
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
