# Maintainer: Jenrikku (JkKU)
pkgname=openutau-bin
pkgver=0.1.567
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=("x86_64" "aarch64")
url="https://github.com/stakira/OpenUtau"
license=("MIT")
makedepends=("tar")
depends=()
provides=("openutau")
conflicts=("openutau")
source=("openutau.svg"
        "openutau.desktop")
source_x86_64=("OpenUtau-linux-x86_64-$pkgver.tar.gz::https://github.com/stakira/OpenUtau/releases/download/$pkgver/OpenUtau-linux-x64.tar.gz")
source_aarch64=("OpenUtau-linux-aarch64-$pkgver.tar.gz::https://github.com/stakira/OpenUtau/releases/download/$pkgver/OpenUtau-linux-arm64.tar.gz")
sha256sums=('490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b'
            '46cdff454ee6ea172ccdd912d64480a2ce7ffc123a89b183ffc74e314fc3c854')
sha256sums_x86_64=('610847e5b60a77b0e692b9406a0983fa1b1002db060e83ad31c4a461fe0f7725')
sha256sums_aarch64=('102e43c1a541ea2b403242b20ba6574403385dce0c7d11c21574d2544b03029e')
noextract=("OpenUtau-linux-x86_64-$pkgver.tar.gz" "OpenUtau-linux-aarch64-$pkgver.tar.gz")
options=(!strip)

package() {
	install -d "${pkgdir}/opt/openutau"
	tar -xf "${srcdir}/OpenUtau-linux-$CARCH-$pkgver.tar.gz" -C "${pkgdir}/opt/openutau"

	# Desktop file and icon
	install -Dm755 "${srcdir}/openutau.desktop" "${pkgdir}/usr/share/applications/openutau.desktop"
	install -Dm644 "${srcdir}/openutau.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openutau.svg"

	# Add link in /bin
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/openutau/OpenUtau" "$pkgdir/usr/bin/openutau"
}
