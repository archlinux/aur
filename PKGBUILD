# Maintainer: Makar986 <wmakar986@gmail.com>
pkgname=prismlauncher-fixes-additions-bin
_pkgname=PrismLauncher
pkgver=1.0.0
pkgrel=2
options=('!strip' '!debug')
pkgdesc="Prism Launcher with custom fixes and offline-mode bypass (Precompiled-bin)"
arch=('x86_64')
url="https://github.com/Makar986/PrismLauncher-Fixes-Additions"
license=('GPL-3.0-only')

depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-5compat'
    'qt6-imageformats'
    'cmark'
    'libarchive'
    'qrencode'
    'tomlplusplus'
    'zlib'
    'hicolor-icon-theme'
)

optdepends=(
    'java-runtime>=17: Для запуска самого Minecraft (рекомендуется jre17-openjdk или jre21-openjdk)'
)

provides=('prismlauncher')
conflicts=('prismlauncher' 'prismlauncher-git' 'prismlauncher-qt5-bin')

source=("https://github.com/Makar986/PrismLauncher-Fixes-Additions/releases/download/v${pkgver}/PrismLauncher-Linux-Qt6-Portable-v${pkgver}.tar.gz")
sha256sums=('79ca4b959de82228f0b8a9f272f297edcb8c3ac4a0b38a33255cccc06f265cec')

package() {
    # Если внутри архива файлы лежат в папке usr/ (твой случай)
    if [ -d "${srcdir}/usr" ]; then
        cp -r "${srcdir}/usr/"* "${pkgdir}/usr/"
    # Если файлы распаковались сразу в корень
    else
        install -d "${pkgdir}/usr/bin"
        install -d "${pkgdir}/usr/lib"
        install -d "${pkgdir}/usr/share"

        [ -d "${srcdir}/bin" ] && cp -r "${srcdir}/bin/." "${pkgdir}/usr/bin/"
        [ -d "${srcdir}/lib" ] && cp -r "${srcdir}/lib/." "${pkgdir}/usr/lib/"
        [ -d "${srcdir}/share" ] && cp -r "${srcdir}/share/." "${pkgdir}/usr/share/"
    fi
}
