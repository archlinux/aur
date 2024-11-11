# Maintainer: lskfd4f noreply@example.com

pkgname=deepl-electron-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Electron wrapper for DeepL Translator (binaries)"
arch=('x86_64')
url="https://github.com/kumakichi/Deepl-linux-electron"
license=("MIT")
source=(
    "https://github.com/kumakichi/Deepl-linux-electron/releases/download/v$pkgver/Deepl-Linux-Electron-$pkgver.AppImage"
    "deepl-electron.desktop"
    "deepl-electron.svg"
)
sha512sums=(
    "195a071dc4c74af82e5bfd433751775f0e7c6a1d5454b6e7d9d5513d1609595ccad8f77fb60dc4771ccfceb9ea45f00d5ec68f9a67cff8cfedd2c86e69f82102"
    "6314ef96cd0f9ea4e472605de64886e680eeed325bbf76634268062342275848d37d4e0882b26ab2ecccb23ec5bcff3a97bcc46494bbd783bea5885d088b6960"
    "216020d3f7325e717113ac85729cbbf99286c26124b2f7e422271867870a96eeb35548b91a1aee89cd8ff1102c526fe8fb1842ef408b18801673d17d418b8595"
)

prepare() {
  chmod +x "Deepl-Linux-Electron-$pkgver.AppImage"
  ./Deepl-Linux-Electron-$pkgver.AppImage --appimage-extract
}

package() {
    mkdir -p "${pkgdir}/opt/deepl-electron"

    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/deepl-electron/"

    chmod -R 755 "${pkgdir}/opt/deepl-electron"

    install -Dm644 "${srcdir}/deepl-electron.desktop" "${pkgdir}/usr/share/applications/deepl-electron.desktop"
    install -Dm644 "${srcdir}/deepl-electron.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deepl-electron.svg"

    mkdir -p "${pkgdir}/usr/bin"

    ln -s "/opt/deepl-electron/deepl-linux-electron" "${pkgdir}/usr/bin/deepl-electron"
}
