# Maintainer: Johannes Schriewer <hallo@dunkelstern.de>
pkgname=ebook-viewer-git
pkgver=r77.2350a74
pkgrel=1
pkgdesc="Modern GTK Python Ebook Reader app to easily read epub files"
arch=('any')
url="https://github.com/michaldaniel/Ebook-Viewer/"
license=('GPL3')
groups=()
depends=('python' 'gtk3' 'gobject-introspection' 'libwebkit3' 'python-gobject')
makedepends=('git' 'make')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install='ebook-viewer.install'
changelog=
source=(
    'ebook-viewer::git+https://github.com/michaldaniel/Ebook-Viewer.git#branch=master'
    'Makefile.patch'
)
noextract=()
sha256sums=(
    'SKIP'
    '20b83b38d7939652d19d473ff1769d481793cdca56d3d87e17261874b8563316'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch <"$srcdir/Makefile.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr" install
}
