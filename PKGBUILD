

pkgname=zoom-native
pkgver=6.6.0
pkgrel=1
pkgdesc="Replace Zoom Workspace's libs by system copies"
arch=(any)
url=https://zoom.us/
optdepends=(
  'qt5-webengine: SSO login'
  'xdg-desktop-portal-impl: Screen sharing on Wayland'
  qt5-{wayland,3d,multimedia,imageformats,remoteobjects} ffmpeg
  chromium vulkan-icd-loader
)
options=(emptydirs) # for CEF
source=(${pkgname}.hook ${pkgname}.sh)
sha256sums=('9f48ca19071e4bf370781f7b339247e291c575511589f7648c29b31ae38f68b4'
            '1e7f13e3b9c2922cad4c1932a2407a42e5ccc61239e11d38b83c6267c0e62fcd')
package(){
  depends=(zoom binutils patchelf fd
    ocl-icd mpg123 libxtst sqlite
    quazip-qt5 qt5-{x11extras,base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative})
  # CEF things
  install -d "$pkgdir"/opt/zoom/{Qt/lib,cef/glibc-hwcaps/x86-64-v2}
  ln -sf /usr/lib/chromium/lib{EGL,GLESv2,vk_swiftshader}.so -t "$pkgdir"/opt/zoom/cef/glibc-hwcaps/x86-64-v2
  # Replace libs
  install -Dm644 ${pkgname}.hook -t "$pkgdir"/usr/share/libalpm/hooks
  install -Dm755 ${pkgname}.sh -t "$pkgdir"/opt/zoom
}
