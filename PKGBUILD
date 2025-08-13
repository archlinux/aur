# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=prasmoid
pkgver=0.0.3
pkgrel=2
pkgdesc="The All in One Development Toolkit for KDE Plasmoids. Build, test, and manage your plasmoids with unparalleled ease and efficiency."
arch=("x86_64")
url='https://github.com/PRASSamin/prasmoid'
license=("MIT")
depends=(
	"plasma-sdk"
	"qt6-declarative"
)
makedepends=(
	"go>=1.22"
	"git"
)

source=(
	"${pkgname}-${pkgver}::git+https://github.com/PRASSamin/prasmoid.git#tag=v0.0.3"
)

sha256sums=(
	'7044508f97f1e4030adaf974aaaa0e19ff4f850b60731ed691cbe4873a12fdd5'
)

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-s -w -X github.com/PRASSamin/prasmoid/internal.Version={pkgver}" -o prasmoid ./src
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
