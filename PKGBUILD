# Maintainer: xihale <xihale.top@qq.com>

pkgname="v2rayn-bin"
pkgver=7.24.9
pkgrel=1
pkgdesc="A GUI client for Windows and Linux, support Xray core and others"
arch=("x86_64" "aarch64")
license=('GPL-3.0-only')
url="https://github.com/2dust/v2rayN"
depends=('fontconfig')
# .NET AOT binaries break if stripped.
options=('!strip')

source_x86_64=("v2rayN-linux-64-${pkgver}.zip::${url}/releases/download/${pkgver}/v2rayN-linux-64.zip")
sha256sums_x86_64=('8847f77fc1f7e8f9afed0790707326ec6685f7c3f10b63dd7a43772f4bfe5fef')
source_aarch64=("v2rayN-linux-arm64-${pkgver}.zip::${url}/releases/download/${pkgver}/v2rayN-linux-arm64.zip")
sha256sums_aarch64=('641189ff33e5a02006b8f4d4ff35b0384fa4fd236dcf6664d075a44cd314e18c')

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
