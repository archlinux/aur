# Maintainer: omansh-krishn <omanshkrishn@duck.com>

pkgname=saturn-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Your go-to ToS Compliant Custom Deezer Client - Freezer Reborn"
arch=('x86_64')
url="https://github.com/SaturnMusic/PC"
license=('GPL3')
depends=( flac libnotify libxtst nss )
makedepends=( libarchive )
optdepends=( libappindicator-gtk3 )
provides=( 'saturnmusic' 'saturnmusic-bin')
conflicts=('saturnmusic' 'saturnmusic-bin')

source=( https://github.com/SaturnMusic/PC/releases/download/v${pkgver}/saturn_${pkgver}_amd64.deb )
# tar.xz doesn't contain icons

sha256sums=('197869f3858bd4808ca7a9399bec89c2b692292c8d380cd7f17ae7728e2b6f55')

package() {
	cd "${srcdir}"
	bsdtar -xf "${srcdir}/data.tar.xz"
	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r 'opt' "${pkgdir}/"

	for res in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256 512x512; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
		install -m644 "${srcdir}/usr/share/icons/hicolor/${res}/apps/saturn.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/saturn.png"
	done

	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/usr/share/applications/saturn.desktop" "${pkgdir}/usr/share/applications/saturn.desktop"

}
