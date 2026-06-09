pkgname=cxhair
pkgver=1.0.0
pkgrel=1
pkgdesc="Custom crosshair overlay for Linux"
arch=('any')
url="https://github.com/cab/calliexhair"
license=('custom:unknown')
depends=('python' 'python-pyqt5' 'python-pynput' 'python-pillow')
source=('crosshair_app.py' 'cxhair' 'crosshair_app.desktop' 'LICENSE')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm644 "${srcdir}/crosshair_app.py" "${pkgdir}/usr/share/cxhair/crosshair_app.py"
  
  install -d "${pkgdir}/usr/bin"
  cat <<WRAPPER > "${pkgdir}/usr/bin/cxhair"
#!/bin/sh
exec python3 /usr/share/cxhair/crosshair_app.py "\$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/cxhair"

  install -Dm644 "${srcdir}/crosshair_app.desktop" "${pkgdir}/usr/share/applications/crosshair_app.desktop"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
