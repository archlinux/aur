pkgname=christmasfetch
pkgver=1.0.r2.2352b3e
pkgrel=1
epoch=
pkgdesc="A simple program that fetches information on the next Christmas!"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64')
url="https://github.com/mattishere/christmasfetch"
license=('MIT')
groups=()
depends=()
makedepends=(git make go)
checkdepends=()
optdepends=()
provides=('christmasfetch')
conflicts=('christmasfetch')
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_ENABLED=1 

	cd "$srcdir/$pkgname"
	go build -o "$pkgname" main.go
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}

	install -Dm755 christmasfetch "$pkgdir/usr/bin"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
