# Maintainer: Your Name <mehad605@gmail.com>
pkgname=bangla-typer-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Desktop Bangla typing trainer"
arch=('x86_64')
url="https://github.com/mehad605/Bangla_Typer"
license=('custom:CC-BY-NC-SA-4.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('bangla-typer')
conflicts=('bangla-typer')

_pkgname="${pkgname%-bin}"
source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/mehad605/Bangla_Typer/v${pkgver}/LICENSE"
)
sha256sums=('dc37c7642efe0e54fb76a70eefae613a5e2b239e3a73e6e7554db0d7f4262861'
            '674c75a8fa913a320d31f9afd27a34a27216a9b64627042a49cabe672aa107a2')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-server" \
        "${pkgdir}/usr/bin/${_pkgname}-server"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF_DESKTOP
[Desktop Entry]
Name=Bangla Typer
Exec=bangla-typer
Icon=bangla-typer
Terminal=false
Type=Application
Categories=Utility;
EOF_DESKTOP

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" <<EOF_SVG
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
  <rect width="512" height="512" rx="64" fill="#2563eb"/>
  <text x="256" y="320" font-family="sans-serif" font-size="280" font-weight="bold" fill="white" text-anchor="middle">ব</text>
</svg>
EOF_SVG

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
