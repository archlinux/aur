# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nnisarg Gada <contact@nnisarg.in>
pkgname=cpig-git
pkgver=r14.fd38047
pkgrel=1
pkgdesc="CPIG: Color Palette Inference Generator is a simple C-based program that generates a color palette from an image file using K-means clustering."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/nnisarggada/cpig"
license=('GPL3')
groups=()
depends=('gcc')
makedepends=('git' 'make')
optdepends=()
provides=('cpig')
conflicts=('cpig')
install=
changelog=
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/cpig"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/cpig"
	make
}

package() {
	cd "$srcdir/cpig"
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -rf * "$pkgdir/opt/$pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
