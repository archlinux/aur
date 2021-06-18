# Maintainer: Morganamilo <morganamilo@gmail.com>
_pkgname=putils
pkgname=putils-git
pkgver=r3.7f4ccee
pkgrel=1
pkgdesc="Utilities for working with pipes"
arch=(x86_64)
url="https://github.com/Morganamilo/putils"
license=('GPL3')
depends=(glibc)
makedepends=(git go asciidoc)
provides=(putils)
conflicts=(putils)
source=("git+https://github.com/Morganamilo/putils")
md5sums=('SKIP')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" all
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install_all
}

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

