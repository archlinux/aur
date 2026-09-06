# Maintainer: Jenrikku (JkKU)
pkgname=openutau-bin
pkgver=0.1.569
pkgrel=1
_tag=$pkgver-beta
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
source_x86_64=("OpenUtau-linux-x86_64-$pkgver.tar.gz::https://github.com/stakira/OpenUtau/releases/download/$_tag/OpenUtau-linux-x64.tar.gz")
source_aarch64=("OpenUtau-linux-aarch64-$pkgver.tar.gz::https://github.com/stakira/OpenUtau/releases/download/$_tag/OpenUtau-linux-arm64.tar.gz")
sha256sums=('490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b'
            '46cdff454ee6ea172ccdd912d64480a2ce7ffc123a89b183ffc74e314fc3c854')
sha256sums_x86_64=('36eb0706ab34f074437936ce6b5ba7b8411636026b2550e34dde30033babf53a')
sha256sums_aarch64=('65f704496d2de6df32b796f584000b43398b427eb3ba4649d5fa23ed10d081cf')
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
