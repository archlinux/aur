# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=saturn-bin
pkgver=3.0.14
pkgrel=2
pkgdesc="Cross-platform deezer client made in Flutter"
arch=('x86_64')
url="https://github.com/Sheathed/Saturn"
license=('GPL3')
depends=( flac libayatana-appindicator libnotify libxtst nss )
optdepends=( libappindicator-gtk3 )
provides=( 'saturnmusic' )
conflicts=('saturn-git')

source=( "${url}/releases/download/v${pkgver}/saturn-${pkgver}-linux.deb" )

sha256sums=('85eb5d70c5059368fb9374304aaf1b70b144a0ddb38d37d9dcc0b454ce85fa65')

package() {
	cd "${srcdir}"
	tar -xf "${srcdir}/data.tar.zst"
	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r 'opt' "${pkgdir}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/Saturn/Saturn" "${pkgdir}/usr/bin/saturn"

	for res in 128x128 256x256; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
		install -m644 "${srcdir}/usr/share/icons/hicolor/${res}/apps/Saturn.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/saturn.png"
	done

	install -dm755 "${pkgdir}/usr/share/applications"
	sed -i "s|Exec=.*|Exec=/opt/Saturn/Saturn %U|" "${srcdir}/usr/share/applications/Saturn.desktop"
	sed -i "s|Icon=.*|Icon=saturn|" "${srcdir}/usr/share/applications/Saturn.desktop"
	install -Dm644 "${srcdir}/usr/share/applications/Saturn.desktop" "${pkgdir}/usr/share/applications/saturn.desktop"

}
