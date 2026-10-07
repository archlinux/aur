# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=img2ascii-git
pkgver=r69.4a233e1
pkgrel=2
pkgdesc="Convert images to ASCII art"
arch=('x86_64')
url="https://github.com/JosefVesely/img2ascii"
license=('MIT')
depends=()
makedepends=('git' 'gcc' 'make')
provides=('img2ascii')
conflicts=('img2ascii')
source=("img2ascii::git+https://github.com/JosefVesely/img2ascii.git")
sha256sums=('SKIP')

pkgver() {
	cd img2ascii
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd img2ascii
	make
}

package() {
	cd img2ascii
	install -Dm755 img2ascii "$pkgdir/usr/bin/img2ascii"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -d "$pkgdir/usr/share/$pkgname/examples" "$pkgdir/usr/share/$pkgname/images"
	install -Dm644 examples/*.png "$pkgdir/usr/share/$pkgname/examples/"
	install -Dm644 images/* "$pkgdir/usr/share/$pkgname/images/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
