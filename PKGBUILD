# Maintainer: Edinei Cavalcanti <hi@edinei.dev>
pkgname=oq-openapi-viewer-git
pkgver=187854389ae313ba4a77075f6154883cca57abc8
pkgrel=1
epoch=
pkgdesc="Terminal OpenAPI Spec viewer"
arch=('x86_64')
url="https://github.com/plutov/oq"
license=('MIT')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
noextract=()
sha256sums=()
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
