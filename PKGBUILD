# Maintainer: chadsr <git at ross dot ch>

pkgname=wolvenkit-cli-bin
pkgver=9.1.0 # renovate: datasource=github-releases depName=WolvenKit/WolvenKit
pkgrel=1
pkgdesc='A modding tool for Cyberpunk 2077'
arch=('x86_64')
url='https://github.com/WolvenKit/WolvenKit'
license=('GPL-3.0-or-later')
depends=('dotnet-runtime')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/${pkgver}/WolvenKit.ConsoleLinux-${pkgver}.zip"
	"LICENSE::https://raw.githubusercontent.com/WolvenKit/WolvenKit/${pkgver}/LICENSE")
b2sums=('8f82b72214f74a25c158e0e58dba1af61457396e3ff608bb948301deaaf979acf5f119119616b02cde3acb38105f6435cb700b31c79e4c4a6b77e4f4e49f7bce'
	'399283bc59e70998486f2ae7b0af9f2f241206dd660e50808be3cef500adef2a9e8d449304f506d93bd2281e6b0729b16145173591deeb105ef545b769453e10')

package() {
	install -d "${pkgdir}/opt/wolvenkit" "${pkgdir}/usr/bin"
	cp -a "${srcdir}/." "${pkgdir}/opt/wolvenkit/"
	rm -f "${pkgdir}/opt/wolvenkit/WolvenKit.ConsoleLinux-${pkgver}.zip"
	chmod +x "${pkgdir}/opt/wolvenkit/WolvenKit.CLI"
	ln -s /opt/wolvenkit/WolvenKit.CLI "${pkgdir}/usr/bin/wolvenkit-cli"

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
