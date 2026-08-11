# Maintainer: chadsr <git at ross dot ch>

pkgname=wolvenkit-cli-bin
pkgver=8.20.0 # renovate: datasource=github-releases depName=WolvenKit/WolvenKit
pkgrel=1
pkgdesc='A modding tool for Cyberpunk 2077'
arch=('x86_64')
url='https://github.com/WolvenKit/WolvenKit'
license=('GPL-3.0-or-later')
depends=('dotnet-runtime')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/WolvenKit/WolvenKit/releases/download/${pkgver}/WolvenKit.ConsoleLinux-${pkgver}.zip"
	"LICENSE::https://raw.githubusercontent.com/WolvenKit/WolvenKit/${pkgver}/LICENSE")
sha256sums=('4c32df4e472e577c354c39c8d990d18a6177f641aa11bf8050430d2205de7930'
	'589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')

package() {
	mkdir -p "${pkgdir}/opt"
	cp -r "${srcdir}" "${pkgdir}/opt/wolvenkit"
	rm "${pkgdir}/opt/wolvenkit/WolvenKit.ConsoleLinux-${pkgver}.zip"
	chmod +x "${pkgdir}/opt/wolvenkit/WolvenKit.CLI"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/wolvenkit/WolvenKit.CLI "${pkgdir}/usr/bin/wolvenkit-cli"

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
