# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：重打包 oplus-connect（OPPO/OnePlus 设备互联客户端）。
#   源码由 aur-auto-update CI 用 cachyos-v3 编译出 .pkg.tar.zst 发到本仓库
#   GitHub Release（tag: oplus-connect-latest），这里只做解包重装，版本随
#   上游 git rev-count 单调递增（1.0.0.r<N>.g<sha>）。
#   sha256 锁构建时产物，source 走 gh-proxy 加速。
pkgname=oplus-connect-private-bin
pkgver=1.0.0.r25.ga461e98
pkgrel=2
pkgdesc='Linux client for OPPO and OnePlus device connectivity（自用维护，CI 自编译重打包版）'
arch=('x86_64')
url='https://github.com/YuKongA/oplus-connect'
# GitHub 下载加速镜像；换镜像可 makepkg GH_MIRROR=https://另一镜像/
_gh_mirror="${GH_MIRROR:-https://gh-proxy.cn/}"
_gh_mirror="${_gh_mirror%/}/"
license=('MIT')
depends=(
  'glibc' 'gcc-libs' 'glib2' 'fontconfig' 'freetype2' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
  'vulkan-icd-loader'
  'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad'
  'gst-plugin-va' 'gst-plugin-pipewire' 'libnice' 'xdg-desktop-portal' 'iproute2'
)
optdepends=(
  'gst-plugins-ugly: software H.264 encoder for tablet screen sharing'
  'libva-driver: GPU-specific VA-API driver'
  'networkmanager: determine the current Wi-Fi network'
)
provides=("oplus-connect=$pkgver")
conflicts=('oplus-connect' 'oplus-connect-git')
source=("${pkgname}-${pkgver}.pkg.tar.zst::${_gh_mirror}https://github.com/Become-ILLUSORY/aur-auto-update/releases/download/oplus-connect-latest/oplus-connect-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('e3dfe649aace947475ef1e686fb62d244aabbe1564cff80a4d13c0226df6d229')

package() {
  bsdtar -xf "$srcdir/${pkgname}-${pkgver}.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}