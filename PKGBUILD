#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>
pkgname=neofetch-port
pkgver=r4.118e0f6
arch=("x86_64")
pkgrel=1
pkgdesc="A port that just reponse with the output of neofetch..."
license=("MIT")
depends=("neofetch")
makedepends=("make")
url="https://github.com/LevitatingBusinessMan/$pkgname"
source=("git+https://github.com/LevitatingBusinessMan/$pkgname.git" "neofetch-port.service")
sha256sums=("SKIP" "411b172f7f877c29ac4083c065de63fd63e0e02fccd2d603b6701e9ab37a12ef")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	cp "neofetch-port.service" "$pkgdir/usr/lib/systemd/system/"
	cd "${srcdir}/${pkgname}"
	mkdir -p "$pkgdir/usr/bin/"
	mv $pkgname "$pkgdir/usr/bin/$pkgname"
}
