# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=linuxdeploy-plugin-qt
pkgver=1_alpha_20250213_1
pkgrel=1
pkgdesc="Qt plugin for linuxdeploy, bundling Qt resources, plugins, QML files and a lot more"
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeploy/linuxdeploy-plugin-qt"
license=('MIT')
depends=('linuxdeploy')
options=('!strip')

_release_tag="${pkgver//_/-}"
_release_base_url="${url}/releases/download/${_release_tag}"

source_x86_64=("${pkgname}-x86_64.AppImage::${_release_base_url}/${pkgname}-x86_64.AppImage")
source_aarch64=("${pkgname}-aarch64.AppImage::${_release_base_url}/${pkgname}-aarch64.AppImage")

sha256sums_x86_64=('15106be885c1c48a021198e7e1e9a48ce9d02a86dd0a1848f00bdbf3c1c92724')
sha256sums_aarch64=('bf1c24aff6d749b5cf423afad6f15abd4440f81dec1aab95706b25f6667cdcf1')

noextract=(linuxdeploy-plugin-qt-*.AppImage)

build() {
    cd "$srcdir"
    # Make AppImages executable
    chmod +x linuxdeploy-plugin-qt-*.AppImage
}

package() {
    cd "$srcdir"

    local appimage_arch="$CARCH"
    case "$CARCH" in
        x86_64|aarch64) ;;
        *)
            echo "Unsupported architecture: $CARCH" >&2
            return 1
            ;;
    esac

    install -Dm755 "${pkgname}-${appimage_arch}.AppImage" "$pkgdir/usr/bin/${pkgname}"
}