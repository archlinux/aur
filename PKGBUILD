# Maintainer: omansh-krishn <omanshkrishn@duck.com>

pkgname=saturn-bin
pkgver=1.0.5
pkgrel=2
pkgdesc="Your go-to ToS Compliant Custom Deezer Client - Freezer Reborn"
arch=('x86_64')
url="https://github.com/SaturnMusic/PC"
license=(GPL3)
depends=( flac libnotify libxtst nss )
makedepends=( libarchive )
optdepends=( libappindicator-gtk3 )
provides=( 'saturnmusic' 'saturnmusic-bin' 'saturn-bin')
conflicts=('saturnmusic' 'saturnmusic-bin' 'saturn-bin')

source=( https://github.com/SaturnMusic/PC/releases/download/v${pkgver}/saturn_${pkgver}_amd64.deb )
# tar.xz doesn't contain icons

sha256sums=('ddc855f8e48b974b2fac6a458604934a7efe6877c858335b85a237f48ae96e26')

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
