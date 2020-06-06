# Maintainer: Ethan Baker <mail@ethanbaker.dev>
# Contributor: Ethan Baker <mail@ethanbaker.dev>
pkgname='cpick'
pkgver=0.9.3
pkgrel=1
#epoch=
pkgdesc="Extensive color picker in the terminal."
arch=('x86_64')
url="https://gitlab.com/ethanbakerdev/cpick"
license=('Apache')
groups=()
depends=('go')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
#changelog=
source=("git+https://gitlab.com/ethanbakerdev/cpick.git")
noextract=()
sha256sums=('SKIP')
#md5sums=()
#validpgpkeys=()

prepare() {
	cd "${pkgname}"
	mkdir -p build/
}

build() {
	cd "${pkgname}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	sudo go build -o build ./...
}

package() {
	cd "${pkgname}"
	install -Dm755 build/cpick "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
