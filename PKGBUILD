# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Sergey M <tz4678@gmail.com>

pkgname=evine
pkgver=0.1.3
pkgrel=1
pkgdesc="Interactive CLI Web Crawler."
arch=('x86_64')
url=https://github.com/saeeddhqan/evine
license=('GPL3')
makedepends=('go')
provides=('evine')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=('https://github.com/saeeddhqan/evine/archive/refs/tags/v.0.1.3.tar.gz')
sha256sums=('b1185f870e33e1d26a49565d534697cd03ae6ba9aa3a7e485970206e986e013a')

build() {
  cd "${pkgname}-v.${pkgver}"
	go build \
			-trimpath \
			-buildmode=pie \
			-mod=readonly \
			-modcacherw \
			-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
			.
}

package() {
  cd "${pkgname}-v.${pkgver}"
  install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
