# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=tinycmmc
pkgname=$_pkgname-git
pkgver=r50.32eaa5b
pkgrel=1
arch=('any')
pkgdesc='Tiny CMake Module Collections'
url=https://github.com/grumbel/$_pkgname
license=('zlib')

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
makedepends=('git' 'cmake')

source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr

	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"

	install -Dm644 "$_pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
