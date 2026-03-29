# Maintainer: Your Name <mehad605@gmail.com>
pkgname=bangla-typer-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop Bangla typing trainer"
arch=('x86_64')
url="https://github.com/mehad605/Bangla_Typer"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('bangla-typer')
conflicts=('bangla-typer')
install='bangla-typer.install'

_pkgname="${pkgname%-bin}"
source=(
    "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
    "${_pkgname}.svg::${url}/raw/main/src-tauri/icons/icon.svg"
)
sha256sums=('68bb65579fc0c4e5ed5d9518e103ecb4bee652edbd265929f0a6ce3af46399a8'
            '5a7a173a21b038d147f3838701b27786894b3c21e9d7972aff5faa0fb0f91534')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-server" \
        "${pkgdir}/usr/bin/${_pkgname}-server"
    install -Dm644 "${srcdir}/${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<-'DESKTOP'
	[Desktop Entry]
	Name=Bangla Typer
	Exec=bangla-typer
	Icon=bangla-typer
	Terminal=false
	Type=Application
	Categories=Utility;
	DESKTOP
}
