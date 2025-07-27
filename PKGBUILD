# Maintainer: Jenrikku (JkKU)
pkgname=openutau-bin
pkgver=0.1.564
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=("x86_64" "aarch64")
url="https://github.com/stakira/OpenUtau"
license=("MIT")
makedepends=("unzip")
depends=()
provides=("openutau")
conflicts=("openutau")
source=("openutau.svg"
        "openutau.desktop")
source_x86_64=("OpenUtau-linux-x86_64-$pkgver.zip::https://github.com/stakira/OpenUtau/releases/download/$pkgver/OpenUtau-linux-x64.zip")
source_aarch64=("OpenUtau-linux-aarch64-$pkgver.zip::https://github.com/stakira/OpenUtau/releases/download/$pkgver/OpenUtau-linux-arm64.zip")
sha256sums=('490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b'
            '46cdff454ee6ea172ccdd912d64480a2ce7ffc123a89b183ffc74e314fc3c854')
sha256sums_x86_64=('b37f6db7f45ea904bdc1ec6d92c0e36c53a896877acb11d0f72376b5368efc02')
sha256sums_aarch64=('643edcee8356faa4d812dbaae8c322ae1072378ce0a3a3b661a8f2539921fdb3')
noextract=("$source_x86_64" "$source_aarch64")
options=(!strip)

package() {
	install -d "${pkgdir}/opt/openutau"
	unzip "${srcdir}/OpenUtau-linux-$CARCH-$pkgver.zip" -d "${pkgdir}/opt/openutau"

	# Desktop file and icon
	install -Dm755 "${srcdir}/openutau.desktop" "${pkgdir}/usr/share/applications/openutau.desktop"
	install -Dm644 "${srcdir}/openutau.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openutau.svg"

	# Add link in /bin
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/openutau/OpenUtau" "$pkgdir/usr/bin/openutau"
}
