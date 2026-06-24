pkgname=digitemp-git
pkgver=3.7.2.r15.gf600e1f
pkgrel=2
pkgdesc="reading values from 1-wire devices"
arch=(i686 x86_64 armv7h)
url="https://www.digitemp.com/software.shtml"
license=('GPL')
provides=('digitemp')
conflicts=('digitemp')
depends=()
makedepends=('libusb-compat' 'git')
optdepends=('libusb-compat: for digitemp_DS2490')
source=("git+https://github.com/bcl/digitemp.git")
sha256sums=("SKIP")

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	make ds9097 ds9097u ds2490
}

package() {
	cd "${pkgname%-git}"
	install -dm0755 "$pkgdir/usr/bin"
	cp -a digitemp_* "$pkgdir/usr/bin/"
}
