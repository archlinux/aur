pkgname=christmasfetch
pkgver=1.0.r1.0bca1d4
pkgrel=1
epoch=
pkgdesc="A simple program that fetches information on the next Christmas!"
arch=(x86_64)
url="https://github.com/mattishere/christmasfetch.git"
license=('MIT')
groups=()
depends=()
makedepends=(git make go)
checkdepends=()
optdepends=()
provides=(christmasfetch)
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

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	sudo make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
