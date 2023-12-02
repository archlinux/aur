# Maintainer: lskfd4f noreply@example.com

pkgname=deepl-electron
pkgver=1.0.0
pkgrel=1
pkgdesc="Electron wrapper for DeepL Translator"
arch=(any)
url="https://github.com/litongjava/electron-deepl-translator"
license=("MIT")
depends=("npm")
source=(
    "https://github.com/litongjava/electron-deepl-translator/archive/refs/tags/v1.0.0.tar.gz"
    "deepl-electron.desktop"
    "deepl-electron.svg"
)
sha512sums=(
    "2ef435ee5093ab575a90888192927fe8b7fdac7d01501a585c5e6a68bed31310aee1e9c5fda16e2e0f907ed0afa4d095428189be318a88f066e84182486c4df4"
    "e2ede41e9d5f80a179324c0285bcde5555adce61daf16bdd800132664a5591a7de1d6b522aa315aac3c2ab26e254b09f100a2e281bba4f8d9b3c67833465d27f"
    "216020d3f7325e717113ac85729cbbf99286c26124b2f7e422271867870a96eeb35548b91a1aee89cd8ff1102c526fe8fb1842ef408b18801673d17d418b8595"
)

build() {
    cd "${srcdir}/electron-deepl-translator-1.0.0"
    npm install
    npm run package
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/electron-deepl-translator-1.0.0/out/electron-deepl-translator-linux-x64/" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/deepl-electron.desktop" "${pkgdir}/usr/share/applications/deepl-electron.desktop"
    install -Dm644 "${srcdir}/deepl-electron.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deepl-electron.svg"
    _symlink deepl-electron
}

_symlink() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/deepl-electron/electron-deepl-translator" "$pkgdir/usr/bin/${1##*/}"
    chmod 755 "$pkgdir/opt/deepl-electron"
}
