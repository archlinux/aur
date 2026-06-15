pkgname=stroke
pkgver=0.4.7
pkgrel=1
pkgdesc="Cross-database desktop studio built with Tauri"
arch=('x86_64')
url="https://github.com/broisnischal/stroke"
license=('custom')
depends=('fuse2')
options=(!strip)

source=("${pkgname}-${pkgver}.AppImage::https://github.com/broisnischal/stroke/releases/download/v${pkgver}/Stroke_${pkgver}_amd64.AppImage")
sha256sums=('0afe45214f7a8bfba026cb2b5783adb8f5b2feadea1d5b1ce818dc8a483edfc7')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/stroke/stroke.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/stroke" <<'WRAPPER'
#!/usr/bin/env sh
# Work around WebKitGTK/EGL allocation failures seen on some Arch Wayland setups.
export WEBKIT_DISABLE_DMABUF_RENDERER=1
export GDK_BACKEND=x11
export GSK_RENDERER=cairo
exec /opt/stroke/stroke.AppImage "$@"
WRAPPER
}
