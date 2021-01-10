# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="okit-git"
pkgver=r44.4aeb168
pkgrel=1
arch=("x86_64")
pkgdesc="The Application toolkit for the Orion Operating System"
url="https://github.com/RosettaHS/OKit#readme"
source=("git+https://github.com/RosettaHS/OKit.git")
md5sums=("SKIP")
license=("MIT")
depends=("libx11" "gcc-libs")
makedepends=("git")
pkgver() {
	cd "$srcdir/OKit"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/OKit"
	make shared
}
package() {
	mkdir -p "$pkgdir/usr/share/licenses/okit-git" \
		"$pkgdir/usr/include/Orion" \
		"$pkgdir/usr/lib"
	cd "$srcdir/OKit"
	cp LICENSE "$pkgdir/usr/share/licenses/okit-git"
	cp libOKit.so "$pkgdir/usr/lib"
	cp -R src/include "$pkgdir/usr/include/Orion/_OKit"
	cp src/SYSHEADER "$pkgdir/usr/include/Orion/OKit"
}
