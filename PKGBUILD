# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Parham Alvani <parham.alvani@gmail.com>

pkgname=gosimac
pkgver=5.0.0
pkgrel=1
pkgdesc="Fetch the wallpaper from Bings, Unsplash..."
arch=('any')
url="https://github.com/1995parham/${pkgname}"
license=('GPL2')
conflicts=("${pkgname}-bin" "${pkgname}-git")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8f4c86ac829b1f6df205808e928664c60a8b5769786abec279ff48728b67f33f')

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
