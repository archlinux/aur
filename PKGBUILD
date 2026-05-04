# Maintainer: Lucas Rooyakkers <lucas rooyakkers @ pm me>
pkgname=figaro-bin
pkgver=0.3.0_alpha
pkgrel=1
pkgdesc="Real-time voice modification program and soundboard"
arch=('x86_64')
url="https://github.com/MattMoony/figaro"
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss')
provides=('figaro')
conflicts=('figaro')
options=('!debug' '!strip')
_pkgver="${pkgver/_/-}"
_tag="v0.3-alpha"
_appdir="figaro-gui-${_pkgver}"
source=(
	"${pkgname}-${_pkgver}.tar.gz::${url}/releases/download/${_tag}/figaro-gui-${_pkgver}.tar.gz"
	"figaro-LICENSE::https://raw.githubusercontent.com/MattMoony/figaro/${_tag}/LICENSE"
	"figaro.desktop"
)
sha256sums=(
	'41676fe8fa2c16233c058bd353b14c68c4eb7d8d338c2606bcd7dfd7c1bf8b6f'
	'1e015eada034fa442daeedaf147fdc5e6284fc6f6b5da7be4600d7f189fe1076'
	'a9c3eb6c418842fb92d1aef7be9959ae843f4ddca132197a73ed550e4034747f'
)

package() {
	install -d "${pkgdir}/opt/figaro" "${pkgdir}/usr/bin"
	cp -a "${srcdir}/${_appdir}/." "${pkgdir}/opt/figaro/"

	install -Dm644 "${srcdir}/figaro-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/figaro.desktop" "${pkgdir}/usr/share/applications/figaro.desktop"
	install -Dm644 "${srcdir}/${_appdir}/media/figaro.png" "${pkgdir}/usr/share/pixmaps/figaro.png"

	ln -s /opt/figaro/figaro-gui "${pkgdir}/usr/bin/figaro-gui"
	ln -s /opt/figaro/bin/figaro "${pkgdir}/usr/bin/figaro"

	chmod 4755 "${pkgdir}/opt/figaro/chrome-sandbox"
}
