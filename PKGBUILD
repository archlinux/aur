# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=vsocks-git
pkgver=14.7d826e2
pkgrel=1
pkgdesc="Make a wifi hotspot with IP/TCP traffic redirected over SOCKS5 Proxy"
arch=('x86_64')
url="https://github.com/ecnx/vsocks"
license=('GPL-3.0-only')
depends=(glibc)
makedepends=(git)
source=("git+https://github.com/ecnx/vsocks.git")
sha256sums=('SKIP')

pkgver() {
	cd vsocks
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd vsocks
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin"

	install -Dm 644 vsocks/License.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install vsocks/bin/vsocks "${pkgdir}/usr/bin/vsocks"
}
