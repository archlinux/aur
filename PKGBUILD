# Maintainer: Mike Ravenblack <0xRavenBlack@github>
pkgname=shadowdate
_appid=0xravenblack.shadowdata
pkgver=0.8.0
pkgrel=1
pkgdesc="A gothic dark-pastel desktop calendar for Linux (Rust + GTK4) with iCalendar support and a background reminder service"
arch=('x86_64')
url="https://github.com/0xRavenBlack/ShadowDate"
options=('!debug')
license=('MIT')
depends=('gtk4' 'glib2')
# The AUR package is just this PKGBUILD: every non-binary source (desktop
# entry, icon, systemd unit, license) is harvested from the repository at the
# release tag via raw.githubusercontent.com, so no local files are needed.
source=("${pkgname}::https://github.com/0xRavenBlack/ShadowDate/releases/download/v${pkgver}/shadowdate-${pkgver}-x86_64-linux"
        "${pkgname}-service::https://github.com/0xRavenBlack/ShadowDate/releases/download/v${pkgver}/shadowdate-service-${pkgver}-x86_64-linux"
        "0xravenblack.shadowdata.desktop::https://raw.githubusercontent.com/0xRavenBlack/ShadowDate/v${pkgver}/0xravenblack.shadowdata.desktop"
        "logo.svg::https://raw.githubusercontent.com/0xRavenBlack/ShadowDate/v${pkgver}/resources/svg/logo.svg"
        "shadowdate-service.service::https://raw.githubusercontent.com/0xRavenBlack/ShadowDate/v${pkgver}/shadowdate-service.service"
        "LICENSE::https://raw.githubusercontent.com/0xRavenBlack/ShadowDate/v${pkgver}/LICENSE")
sha256sums=('ae4cdc9eaa81ecbd31ccdf8274ddaa0e3a156fa9d5a3e02fc56a1afe22906955'
            '4be6f44126758f5f3c168d9cfcb4b7c51179493f3ade7b5b046c3cd5b1154f70'
            '8a9962947917a207b2648c9be705f5e6c2f64120085bf514929fe11c20ca8b6e'
            '0e9ff4ee3ef214ef48cfcc73b0337f751feee24366f1f871687a871b417efe30'
            '1b0a55a83d591047c5e244a40f991fbb151bf98aeb39a5856272731442043301'
            '32c7d774d68ff9f1adc053fd55c2ac1a1c0f31bbfabed2528acb96c05ce64e00')

package() {
    cd "${srcdir}"

    # Prebuilt release binaries (shadowdate-<pkgver>-x86_64-linux)
    install -Dm755 "shadowdate" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "shadowdate-service" "${pkgdir}/usr/bin/${pkgname}-service"

    # Desktop entry
    install -Dm644 "0xravenblack.shadowdata.desktop" \
        "${pkgdir}/usr/share/applications/${_appid}.desktop"

    # Icon (logo.svg is a vector SVG; installed as the scalable themed icon)
    install -Dm644 "logo.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"

    # Systemd user unit for the background reminder service
    install -Dm644 "shadowdate-service.service" \
        "${pkgdir}/usr/lib/systemd/user/shadowdate-service.service"

    # License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
