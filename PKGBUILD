# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=linuxdeploy-plugin-qt
pkgver=1_alpha_20250213_1
pkgrel=3
pkgdesc="Qt plugin for linuxdeploy, bundling Qt resources, plugins, QML files and a lot more"
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeploy/linuxdeploy-plugin-qt"
license=('MIT')
depends=('linuxdeploy')
options=('!strip')

_release_tag="${pkgver//_/-}"
_release_base_url="${url}/releases/download/${_release_tag}"

source=("LICENSE.txt::${url}/raw/${_release_tag}/LICENSE.txt")
source_x86_64=("${pkgname}-x86_64.AppImage::${_release_base_url}/${pkgname}-x86_64.AppImage")
source_aarch64=("${pkgname}-aarch64.AppImage::${_release_base_url}/${pkgname}-aarch64.AppImage")

sha256sums=('1edb41ae7601854ae15d113c3700beebd0ea3ed05b85e3786a94a72bb9916091')
sha256sums_x86_64=('15106be885c1c48a021198e7e1e9a48ce9d02a86dd0a1848f00bdbf3c1c92724')
sha256sums_aarch64=('bf1c24aff6d749b5cf423afad6f15abd4440f81dec1aab95706b25f6667cdcf1')

# 加引号，避免在有已下载 AppImage 的目录里被 shell 展开，导致 .SRCINFO 不稳定
noextract=('linuxdeploy-plugin-qt-*.AppImage')

package() {
    cd "$srcdir"

    install -Dm755 "${pkgname}-${CARCH}.AppImage" "$pkgdir/usr/bin/${pkgname}"

    # AppImage 里没有许可证文件，从上游同一 tag 取 LICENSE.txt
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
