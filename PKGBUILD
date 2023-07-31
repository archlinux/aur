# Maintainer : K.B.Dharun Krishna <kbdharunkrishna@gmail.com>

pkgname=vib
pkgver=0.2.11
pkgrel=1
pkgdesc="Vib (Vanilla Image Builder) is a tool that allow generating Containerfile(s) using a Flatpak-like recipe and syntax."
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/Vib'
license=(GPL3)
makedepends=(go)
source=("$Vib-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1c78b8ad70f8df3b41a4d48c187c6ee4130553c2197ce2a4527552544db6508b07bfbcac4202ba78cffe2f7375cd03c0996e712b4d246aac4f0508c6425f6721')

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
