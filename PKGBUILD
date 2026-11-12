# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：重打包 oplus-connect（OPPO/OnePlus 设备互联客户端）。
#   源码由 aur-auto-update CI 用 cachyos-v3 编译出 .pkg.tar.zst 发到本仓库
#   GitHub Release（tag: oplus-connect-latest），这里只做解包重装，版本随
#   上游 git rev-count 单调递增（1.0.0.r<N>.g<sha>）。
#   sha256 锁构建时产物，source 走 gh-proxy 加速。
pkgname=oplus-connect-private-bin
pkgver=1.0.0.r19.gfd752ee
pkgrel=1
pkgdesc='Linux client for OPPO and OnePlus device connectivity（自用维护，CI 自编译重打包版）'
arch=('x86_64')
url='https://github.com/YuKongA/oplus-connect'
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
source=("${pkgname}-${pkgver}.pkg.tar.zst::https://gh-proxy.com/https://github.com/Become-ILLUSORY/aur-auto-update/releases/download/oplus-connect-latest/oplus-connect-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('398e43ea6336d160802a5bd8cbd87099f3a3cd709cda5af026049540e6e47b21')

package() {
  bsdtar -xf "$srcdir/${pkgname}-${pkgver}.pkg.tar.zst" \
    -C "$pkgdir" --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO'
}