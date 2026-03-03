# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=steamvr-linux-fixes-layer-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A Vulkan layer that patches SteamVR's vrcompositor to address issues for wired headsets"
arch=('x86_64')
url="https://github.com/BnuuySolutions/SteamVRLinuxFixes"
license=('MIT')
source=(
  "$pkgname-$pkgver.zip::https://github.com/BnuuySolutions/SteamVRLinuxFixes/releases/download/v$pkgver/VK_LAYER_BNUUY_steamvr_linux_fixes.zip"
)
sha256sums=(
  'df933084df5da0d13296f2e90b47d1fa3c52eca2aa71dd09ae1a747fdb4a3305'
)

prepare() {
  # Make sure the JSON file points to the system library path instead of a relative path
  sed -i 's/"library_path": ".\/libsteamvr_linux_fixes.so"/"library_path": "libsteamvr_linux_fixes.so"/' "$srcdir/VkLayer_steamvr_linux_fixes.json"
}

package() {  
  install -d "$pkgdir/usr/share/vulkan/implicit_layer.d"
  install -m755 "$srcdir/VkLayer_steamvr_linux_fixes.json" "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_steamvr_linux_fixes.json"
  install -d "$pkgdir/usr/lib/"
  install -m755 "$srcdir/libsteamvr_linux_fixes.so" "$pkgdir/usr/lib/libsteamvr_linux_fixes.so"
}
