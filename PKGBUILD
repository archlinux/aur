# Maintainer: KirTrub
pkgname=pyhotspot-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern GUI for Linux Hotspot management (PyQt6 + NetworkManager)"
arch=('any')
url="https://github.com/KirTrub/PyWiHotspot"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-qrcode' 'python-pillow' 'networkmanager' 'sh')
makedepends=('git')
provides=('pyhotspot')
conflicts=('pyhotspot')
source=('git+https://github.com/KirTrub/PyWiHotspot.git')
sha256sums=('SKIP')

package() {
  cd "$srcdir/PyWiHotspot"
  
  install -d "$pkgdir/usr/share/pyhotspot"
  install -d "$pkgdir/usr/bin"
  
  cp -r core ui widgets "$pkgdir/usr/share/pyhotspot/"
  
  echo -e "#!/bin/sh\npython /usr/share/pyhotspot/core/main.py \"\$@\"" > "$pkgdir/usr/bin/pyhotspot"
  chmod +x "$pkgdir/usr/bin/pyhotspot"
  
  install -Dm644 pyhotspot.desktop "$pkgdir/usr/share/applications/pyhotspot.desktop"
}