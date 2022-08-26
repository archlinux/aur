# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac
pkgver=5.5.2
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=('any')
url="https://github.com/1995parham/${pkgname}"
license=('GPL2')
conflicts=("${pkgname}-bin" "${pkgname}-git")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08b20c84982f2e3803312dc395fb4069745bea64cc2f7e102316a35965630795')

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
