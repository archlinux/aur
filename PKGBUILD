# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=libargparse
pkgname=$_pkgname-git
pkgver=r69.ee74d1b
pkgrel=1
pkgdesc="A C++ command-line parsing library"
arch=(x86_64)
url="https://github.com/kmurray/libargparse"
license=('MIT')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"git+$url"
)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

check() {
	make -C build -k test
}

package() {
	make -C build DESTDIR="$pkgdir/" install

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_pkgname/LICENSE.md"
}
