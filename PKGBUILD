# Maintainer: lskfd4f noreply@example.com

pkgname=deepl-electron
pkgver=1.5.0
pkgrel=4
pkgdesc="Electron wrapper for DeepL Translator"
arch=(any)
url="https://github.com/kumakichi/Deepl-linux-electron"
license=("MIT")
makedepends=("yarn")
source=(
    "https://github.com/kumakichi/Deepl-linux-electron/archive/refs/tags/v1.5.0.tar.gz"
    "deepl-electron.desktop"
    "deepl-electron.svg"
)
sha512sums=(
    "0507b017a3618b444e42b6988c9d8d803008e80ca5fcdfbee8b92b468b1d0f702172718c6208771abc44141296054a5967c5fcff9f5bd37311ff5c5f6917231d"
    "6314ef96cd0f9ea4e472605de64886e680eeed325bbf76634268062342275848d37d4e0882b26ab2ecccb23ec5bcff3a97bcc46494bbd783bea5885d088b6960"
    "216020d3f7325e717113ac85729cbbf99286c26124b2f7e422271867870a96eeb35548b91a1aee89cd8ff1102c526fe8fb1842ef408b18801673d17d418b8595"
)

build() {
    cd "${srcdir}/Deepl-linux-electron-1.5.0"
    yarn
    yarn dist:dir
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/Deepl-linux-electron-1.5.0/dist/linux-unpacked/" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/deepl-electron.desktop" "${pkgdir}/usr/share/applications/deepl-electron.desktop"
    install -Dm644 "${srcdir}/deepl-electron.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deepl-electron.svg"
    _symlink deepl-electron
}

_symlink() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/deepl-electron/deepl-linux-electron" "$pkgdir/usr/bin/${1##*/}"
    chmod 755 "$pkgdir/opt/deepl-electron"
}
