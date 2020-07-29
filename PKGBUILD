# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=numworks-epsilon
pkgver=14.4.1
_pkgver=b83c686773b00d8a6ed2919672fd6cda6e14285a
pkgrel=1
pkgdesc="A simulator for the Numworks graphic calculator (Epsilon firmware)"
arch=('x86_64')
url="https://www.numworks.com/resources/engineering/software/"
license=('custom:CC-BY-NC-SA')
groups=()
depends=('gcc-libs' 'libxext' 'libjpeg-turbo')
makedepends=('freetype2' 'imagemagick' 'gendesk')
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/numworks/epsilon/archive/$_pkgver.tar.gz")
md5sums=('eb2f532e6d06294bffce750015f21097')

prepare() {
	cd "epsilon-$_pkgver"
	convert -background "#FFB734" "ion/src/simulator/assets/logo.svg" "$pkgname.png"
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Numworks Epsilon" --icon "$pkgname" --exec "$pkgname" --categories "Education;Emulator"
}

build() {
	cd "epsilon-$_pkgver"
	make PLATFORM=simulator clean
	make PLATFORM=simulator
}

package() {
	cd "epsilon-$_pkgver"
	install -Dm755 output/release/simulator/linux/epsilon.bin "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
