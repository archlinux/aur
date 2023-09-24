# Maintainer: lskfd4f noreply@example.com

pkgname=deepl-electron
pkgver=1.0.0
pkgrel=1
pkgdesc="Electron wrapper for DeepL Translator"
arch=(any)
url="https://github.com/litongjava/electron-deepl-translator"
license=("MIT")
depends=("npm")
source=("https://github.com/litongjava/electron-deepl-translator/archive/refs/tags/v1.0.0.tar.gz")
sha512sums=("2ef435ee5093ab575a90888192927fe8b7fdac7d01501a585c5e6a68bed31310aee1e9c5fda16e2e0f907ed0afa4d095428189be318a88f066e84182486c4df4")

build() {
    cd "${srcdir}/electron-deepl-translator-1.0.0"
    npm install
    npm run package
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/electron-deepl-translator-1.0.0/out/electron-deepl-translator-linux-x64/" "${pkgdir}/opt/${pkgname}"
    _symlink deepl-electron
}

_symlink() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/deepl-electron/electron-deepl-translator" "$pkgdir/usr/bin/${1##*/}"
    chmod 755 "$pkgdir/opt/deepl-electron"
}
