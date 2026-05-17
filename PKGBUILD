# Maintainer: Koenrin <dildeepp304@gmail.com>
pkgname=zoom-koenrin
pkgver=6.5.11.4015
pkgrel=2
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
url="https://zoom.us"
license=('custom')
options=('!strip' '!debug')
depends=('glib2' 'libpulse' 'libxcb' 'libxshmfence' 'xcb-util-image'
         'xcb-util-keysyms' 'xcb-util-cursor'
         'qt5-base' 'qt5-svg' 'qt5-x11extras' 'qt5-declarative')
optdepends=('xdg-desktop-portal-impl: screen sharing on Wayland')
source=("zoom-${pkgver}_x86_64.pkg.tar.xz::https://cdn.zoom.us/prod/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha256sums=('87835934335392c9907126e16ccd7a3665e1f0b459039c19a6d5aa28c19ef346')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
  cp -r "${srcdir}/opt" "${pkgdir}/"

  rm -f "${pkgdir}/usr/bin/zoom"
  cat > "${pkgdir}/usr/bin/zoom" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH=/opt/zoom/Qt/lib:/opt/zoom:$LD_LIBRARY_PATH
exec /opt/zoom/ZoomLauncher "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/zoom"
}
