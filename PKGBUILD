# Maintainer: hertg <aur@her.tg>
_pkgname=egpu-switcher
pkgname=$_pkgname-git
pkgver=0.18.0.r0.ge4bf70a
pkgrel=1
pkgdesc="Automatically detect and use eGPU on startup, git version"
arch=('any')
url="https://github.com/hertg/egpu-switcher"
license=('GPL')
depends=()
makedepends=('git' 'go')
provides=($_pkgname)
conflicts=($_pkgname)
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/hertg/egpu-switcher.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export ORIGIN="aur"
	make build -s
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install -s
}

