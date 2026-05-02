# Maintainer: Your Name <mehad605@gmail.com>
pkgname=bangla-typer-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Desktop Bangla typing trainer"
arch=('x86_64')
url="https://github.com/mehad605/Bangla_Typer"
license=('custom:CC-BY-NC-SA-4.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'yt-dlp')
provides=('bangla-typer')
conflicts=('bangla-typer')

_pkgname="${pkgname%-bin}"
source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=('4f20e9482a9f796ba7bc972d635619c965bf744ef9298146c2ef227f307e8540'
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
<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <rect width="512" height="512" rx="100" fill="#0F172A"/>
  <text x="256" y="170" text-anchor="middle" font-family="sans-serif" font-size="96" fill="#38BDF8" font-weight="700">বাংলা</text>
  <rect x="96" y="240" width="320" height="160" rx="24" fill="#1E293B"/>
  <g fill="#E2E8F0">
    <rect x="120" y="260" width="40" height="28" rx="6"/>
    <rect x="168" y="260" width="40" height="28" rx="6"/>
    <rect x="216" y="260" width="40" height="28" rx="6"/>
    <rect x="264" y="260" width="40" height="28" rx="6"/>
    <rect x="312" y="260" width="40" height="28" rx="6"/>
    <rect x="360" y="260" width="32" height="28" rx="6"/>
    <rect x="132" y="300" width="40" height="28" rx="6"/>
    <rect x="180" y="300" width="40" height="28" rx="6"/>
    <rect x="228" y="300" width="40" height="28" rx="6"/>
    <rect x="276" y="300" width="40" height="28" rx="6"/>
    <rect x="324" y="300" width="40" height="28" rx="6"/>
    <rect x="176" y="340" width="160" height="28" rx="8"/>
  </g>
</svg>
EOF_SVG

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
