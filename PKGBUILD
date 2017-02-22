# Maintainer: Elimpfor <aur@s403.33mail.com>
pkgname=busysteg-git
pkgver=r10.6857c59
pkgrel=1
epoch=
pkgdesc="Steganography tool to hide information content into busy areas of images, optimally"
arch=('x86_64' 'i686')
url="https://github.com/jaybosamiya/busysteg"
license=('MIT')
depends=('opencv')
makedepends=('git' 'cmake')
source=("${pkgname}::git+git://github.com/jaybosamiya/busysteg.git" "https://jay.mit-license.org/license.txt")
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$pkgname"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	cmake .
	make
}

package() {
	install -D -m644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        cd "${srcdir}/${pkgname}"
	install -D -m755 busysteg "$pkgdir/usr/bin/busysteg"
}
