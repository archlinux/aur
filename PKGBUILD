# Maintainer: xuezhajv <liaozecheng123@163.com>  qq群：293748695
# Contributor: github.com/FPSZ <
pkgname=sealantern
pkgver=1.3.0
pkgrel=1
_debarch=amd64
pkgdesc="A lightweight Minecraft server management tool based on Tauri 2 + Rust + Vue 3"
arch=('x86_64')
url="https://github.com/SeaLantern-Studio/SeaLantern"
license=('GPL-3.0-or-later')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'openssl'
)

# 可选依赖（推荐但不是必须的）
optdepends=(
    'ffmpeg: 视频/音频编解码支持'
    'gst-plugins-base: GStreamer 基础插件'
    'gst-plugins-good: GStreamer 优质插件'
    'gst-plugins-bad: GStreamer 额外插件'
    'gst-plugins-ugly: GStreamer 非自由插件'
    'noto-fonts: 更好的字体显示'
    'noto-fonts-cjk: 中日韩字体支持'
    'noto-fonts-emoji: 表情符号支持'
)

options=('!strip' '!emptydirs')
install=sealantern.install

source=(
    "${pkgname}-${pkgver}-${_debarch}.deb::https://github.com/SeaLantern-Studio/SeaLantern/releases/download/v1.3.0/Sea.Lantern_${pkgver}_${_debarch}.deb"
    'sealantern.desktop'
)
sha256sums=(
    'SKIP'
    'SKIP'
)

package() {
    local deb="${srcdir}/${pkgname}-${pkgver}-${_debarch}.deb"

    bsdtar --no-same-owner -xf "${deb}" -C "${srcdir}" data.tar.*
    bsdtar --no-same-owner -xpf "${srcdir}"/data.tar.* -C "${pkgdir}"

    rm -f "${pkgdir}/usr/share/applications/Sea Lantern.desktop"
    install -Dm644 "${srcdir}/sealantern.desktop" \
        "${pkgdir}/usr/share/applications/sealantern.desktop"
}
