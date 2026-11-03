# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=saturn-canary-bin
pkgver=4.0.2
_canary_rel=51
pkgrel=1
pkgdesc="Cross-platform deezer client made in Flutter - Canary Version"
arch=('x86_64')
url="https://github.com/Sheathed/Saturn"
license=('GPL3')
depends=( flac libayatana-appindicator libnotify libxtst nss )
optdepends=( libappindicator-gtk3 )
provides=( 'saturnmusic' )
conflicts=('saturn-canary-git')

source=( "${url}/releases/download/v${pkgver}-canary.${_canary_rel}/saturn-canary-${pkgver}+${_canary_rel}-linux-canary.${_canary_rel}.deb" )

sha256sums=('03b670b6da80e73e8e2888b1b073f5cb4789a0394c2b218698723adfac87a0f1')

package() {
	cd "${srcdir}"
	tar -xf "${srcdir}/data.tar.zst"
	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r "${srcdir}/opt/Saturn" "${pkgdir}/opt/saturn-canary"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/saturn-canary/Saturn" "${pkgdir}/usr/bin/saturn-canary"

	for res in 128x128 256x256; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
		install -m644 "${srcdir}/usr/share/icons/hicolor/${res}/apps/Saturn.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/s.s.saturn.canary.png"
	done

	install -dm755 "${pkgdir}/usr/share/applications"
	sed -i "s|Exec=.*|Exec=saturn-canary %U|" "${srcdir}/usr/share/applications/Saturn.desktop"
	sed -i "s|Icon=.*|Icon=s.s.saturn.canary|" "${srcdir}/usr/share/applications/Saturn.desktop"
	install -Dm644 "${srcdir}/usr/share/applications/Saturn.desktop" "${pkgdir}/usr/share/applications/s.s.saturn.canary.desktop"

}
