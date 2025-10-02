# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=prasmoid
pkgver=0.1.0
pkgrel=1
pkgdesc="The All in One Development Toolkit for KDE Plasmoids. Build, test, and manage your plasmoids with unparalleled ease and efficiency."
arch=("x86_64")
url='https://github.com/PRASSamin/prasmoid'
license=("MIT")
depends=(
	"plasma-sdk"
	"qt6-declarative"
)
makedepends=(
	"go>=1.23"
	"git"
)

source=(
	"${pkgname}-${pkgver}::git+https://github.com/PRASSamin/prasmoid.git#tag=v0.1.0"
)

sha256sums=('7eb93c4ca078b8bff03eb3517490c55d5a1c91740b187bf02b828865124666ee')

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
		-ldflags "-s -w -X github.com/PRASSamin/prasmoid/internal.Version=${pkgver}" -o prasmoid .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	echo "\033[32m 🡪 Cast a vote :) - https://aur.archlinux.org/packages/prasmoid"
}
# vim:set ts=2 sw=2 et:
