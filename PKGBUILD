# Maintainer : K.B.Dharun Krishna <kbdharunkrishna@gmail.com>

pkgname=vib
pkgver=0.2.12
pkgrel=1
pkgdesc="Vib (Vanilla Image Builder) is a tool that allow generating Containerfile(s) using a Flatpak-like recipe and syntax."
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/Vib'
license=(GPL3)
makedepends=(go)
source=("$Vib-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1fae664f3b8bfd9dd596a09384d61ef1b221db5d0b21d1f20504f5c849f1913217383effb57d9984f6ef01b68ab584fa13e6922d1b3cb0e5c27c23a20de07f55')

prepare(){
	cd "Vib-${pkgver}"
	mkdir -p build/
}

build() {
	cd "Vib-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build
}

package() {
	cd "Vib-${pkgver}"
	install -Dm755 "build/vib" "${pkgdir}/usr/bin/${pkgname}"
}
