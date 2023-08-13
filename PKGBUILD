# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=mp3cat
pkgver=4.2.2
pkgrel=1
pkgdesc="A command line utility for joining MP3 files."
arch=('any')
url="https://www.dmulholl.com/dev/mp3cat.html"
license=('Unlicense')
makedepends=('go' 'git')
options=(!lto strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dmulholl/mp3cat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('457e680e5b05e8a5a50a8b557372e23bf797026f43253efdff14b8137f214470')

build(){
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
	export GOPATH="${srcdir}"
	go build -ldflags='-compressdwarf=false -linkmode=external'
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 mp3cat "${pkgdir}/usr/bin/mp3cat"
	install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
