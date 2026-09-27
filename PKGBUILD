# Maintainer: hitalin <https://github.com/hitalin>
# split package: アプリ (misskey-notedeck-bin) / 常駐コア (notecored-bin) / CLI (notecli-bin) を
# 同じタグの Release から同版で出す (#1106)。sha256sums は release.yml が実値で埋める
pkgbase=misskey-notedeck-bin
pkgname=('misskey-notedeck-bin' 'notecored-bin' 'notecli-bin')
pkgver=1.73.0
pkgrel=1
arch=('x86_64')
url='https://github.com/notedeck-dev/notedeck'
license=('AGPL-3.0-or-later')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/notedeck-dev/notedeck/releases/download/v${pkgver}/NoteDeck-${pkgver}-linux-x64.tar.gz"
        "notecli-${pkgver}-linux-amd64::https://github.com/notedeck-dev/notedeck/releases/download/v${pkgver}/notecli-${pkgver}-linux-amd64"
        "notedeck.desktop"
        "notedeck-icon-128.png::https://raw.githubusercontent.com/notedeck-dev/notedeck/v${pkgver}/src-tauri/icons/128x128.png"
        "notedeck-icon-32.png::https://raw.githubusercontent.com/notedeck-dev/notedeck/v${pkgver}/src-tauri/icons/32x32.png")
sha256sums=('d09f4190d903661c475113a52f2c4a8b6a4b2bc1f593ac9ae5a14455ff20303e'
            '109638636930b73beb92a5667f4d3b0394f89cca9c97a4e9ba2a0dd0853cd930'
            '402b528d0bc1d1747ad0aba623994ab4b3efa24ad3877c80bb9c8e31d2775ba5'
            '20ccfc14895ab30ee165475cb8a5121711114fcab0226a2516db8dd6d0a7e017'
            '4b4d94d68706298000bed6f1dff338a06bb13de2ab6587cf2db65bb992bb5693')

package_misskey-notedeck-bin() {
    pkgdesc='Misskey Pro — integrated deck environment (IDE) for Misskey power users'
    depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'glib-networking')
    optdepends=("notecored-bin=${pkgver}: 常駐コア (アプリを閉じても動き続ける。アプリと同じ版が要る)"
                "notecli-bin=${pkgver}: CLI")
    provides=('notedeck')
    conflicts=('notedeck' 'notedeck-bin')
    install -Dm755 "${srcdir}/notedeck" "${pkgdir}/usr/bin/notedeck"
    install -Dm644 "${srcdir}/notedeck.desktop" "${pkgdir}/usr/share/applications/com.notedeck.desktop.desktop"
    install -Dm644 "${srcdir}/notedeck-icon-128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.notedeck.desktop.png"
    install -Dm644 "${srcdir}/notedeck-icon-32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/com.notedeck.desktop.png"
}

package_notecored-bin() {
    pkgdesc='NoteDeck resident core daemon (headless notecore)'
    depends=('systemd')
    provides=('notecored')
    conflicts=('notecored')
    install -Dm755 "${srcdir}/notecored" "${pkgdir}/usr/bin/notecored"
    install -Dm644 "${srcdir}/notecored.service" "${pkgdir}/usr/lib/systemd/user/notecored.service"
}

package_notecli-bin() {
    pkgdesc='Misskey CLI from NoteDeck'
    provides=('notecli')
    conflicts=('notecli')
    install -Dm755 "${srcdir}/notecli-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/notecli"
}
