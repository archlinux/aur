# Maintainer: Jenrikku (JkKU)
pkgname=openutau-bin
pkgver=0.1.573
pkgrel=1
_tag=$pkgver-beta
pkgdesc="Open source UTAU successor"
arch=("x86_64" "aarch64")
url="https://github.com/openutau/OpenUtau"
license=("MIT")
makedepends=("tar")
depends=()
provides=("openutau")
conflicts=("openutau")
source=("openutau.svg"
        "openutau.desktop")
source_x86_64=("OpenUtau-linux-x86_64-$pkgver.tar.gz::https://github.com/openutau/OpenUtau/releases/download/$_tag/OpenUtau-linux-x64.tar.gz")
source_aarch64=("OpenUtau-linux-aarch64-$pkgver.tar.gz::https://github.com/openutau/OpenUtau/releases/download/$_tag/OpenUtau-linux-arm64.tar.gz")
sha256sums=('490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b'
            '46cdff454ee6ea172ccdd912d64480a2ce7ffc123a89b183ffc74e314fc3c854')
sha256sums_x86_64=('f105f6c67319382d2796d19989fca54007259d97b195024aab1f4f1c8a5cea7e')
sha256sums_aarch64=('ab0dd66f8ce40074b4b38c7e7601afcb245f14c10a53994f57d64981b034be5f')
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
