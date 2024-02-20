# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Terin Stock <terinjokes@gmail.com>

pkgname=archiver
pkgver=3.5.1
pkgrel=2
pkgdesc="Easily create & extract archives, and compress & decompress files of various formats"
arch=("x86_64")
url="https://github.com/mholt/archiver"
license=("MIT")
makedepends=("go")
depends=("glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mholt/archiver/archive/v${pkgver}.tar.gz")

build() {
	cd "${pkgname}-${pkgver}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o . ./cmd/arc/
}

check() {
	cd "${pkgname}-${pkgver}"
	go test ./...
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 arc -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
sha256sums=('b69a76f837b6cc1c34c72ace16670360577b123ccc17872a95af07178e69fbe7')
