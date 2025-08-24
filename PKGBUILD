# Maintainer: lonkaars <loek at pipeframe dot xyz>

pkgname=xdimmer-git
pkgver=v1.7.r3.gae37d7f
pkgrel=1
pkgdesc='lightweight X11 utility to dim the screen and/or keyboard backlight when idle'
arch=(i686 x86_64 armv7h aarch64)
license=('BSD-3-Clause')
depends=(libbsd libx11 libxrandr libxext libxi)
provides=(xdimmer)
conflicts=(xdimmer)
url=https://github.com/jcs/xdimmer
source=(git+https://github.com/jcs/xdimmer)
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/xdimmer"
	git describe --long --tags | sed 's/[^-]*-g/r\0/;s/-/./g'
}

build() {
	cd "${srcdir}/xdimmer"
	LIBS='-lbsd' make
}

package() {
	cd "${srcdir}/xdimmer"
	PREFIX=/usr DESTDIR="$pkgdir" make install
}

