# Maintainer: xihale <xihale.top@qq.com>

pkgname="v2rayn-bin"
pkgver=8.0.2
pkgrel=1
pkgdesc="A GUI client for Windows and Linux, support Xray core and others"
arch=("x86_64" "aarch64")
license=('GPL-3.0-only')
url="https://github.com/2dust/v2rayN"
depends=('fontconfig')
# .NET AOT binaries break if stripped.
options=('!strip')

source_x86_64=("v2rayN-linux-64-${pkgver}.zip::${url}/releases/download/${pkgver}/v2rayN-linux-64.zip")
sha256sums_x86_64=('ba698c113a168fb6b4b01c85a284cd83e9c55508091ae2655ff3275e8b04c97d')
source_aarch64=("v2rayN-linux-arm64-${pkgver}.zip::${url}/releases/download/${pkgver}/v2rayN-linux-arm64.zip")
sha256sums_aarch64=('cb80a0d71ff12a05cd79fdf525bf2a8f064e1938ca02a3c0278c029eb3adbe67')

source=("v2rayN.png" "v2rayN-bin.desktop")
sha256sums=('f762fd95d93c2287f55ebb742716a54aa6b507ff8c8d75aec7256fabc93192ee'
            '3ffdcee071758d3a46fe189e332299fc59ad92ecbdbab8fba8927d978e6f2912')

package() {
  local _dest="$pkgdir/opt/$pkgname"

  install -Dm644 "$srcdir/v2rayN.png"        -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 "$srcdir/v2rayN-bin.desktop" -t "$pkgdir/usr/share/applications"

  install -dm755 "$_dest"
  cp -a "$srcdir"/v2rayN-linux-*/. "$_dest/"

  # Upstream zip perms are inconsistent; normalize and set executables.
  find "$_dest" -type d -exec chmod 0755 {} +
  find "$_dest" -type f -exec chmod 0644 {} +
  chmod 0755 "$_dest"/v2rayN "$_dest"/AmazTool \
              "$_dest"/bin/xray/xray "$_dest"/bin/sing_box/sing-box \
              "$_dest"/bin/mihomo/mihomo
}
