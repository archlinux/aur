# Maintainer: Simon Ser
pkgname=annotatesh-git
_pkgname=annotatesh
pkgver=r6.002787d69543
pkgrel=1
license=('MIT')
pkgdesc='Generate sr.ht annotation graphs for POSIX shell scripts'
makedepends=("meson" "git")
depends=("mrsh" "json-c")
arch=("x86_64")
url='https://git.sr.ht/~emersion/annotatesh'
source=("${pkgname%-*}::git+https://git.sr.ht/~emersion/annotatesh")
sha1sums=('SKIP')
provides=('annotatesh')
conflicts=('annotatesh')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	meson --prefix=/usr build/
	ninja -C build/
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir/" ninja -C build/ install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname%-*}"/LICENSE
}
