# Maintainer: Vinicius Moreira

pkgname=bauh-staging
pkgver=0.5.1.R
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/0ee6d85dd1eeb22eae16470ad15aafc9652712b1.zip")
sha512sums=('8bfe96dfb8da05cd8ec813d14b563bda834d60dc2db2232740558e558fe5ebe33f9e3c7c318ef33ea55b41d153b63034b4795a5608b0351b0f848c5d4c786edf')

build() {
  cd "${srcdir}/bauh-0ee6d85dd1eeb22eae16470ad15aafc9652712b1"
  python3 setup.py build
}

package() {
  cd "${srcdir}/bauh-0ee6d85dd1eeb22eae16470ad15aafc9652712b1"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/local/bin

  mv bauh.desktop $pkgdir/usr/share/applications/
  mv bauh_tray.desktop $pkgdir/usr/share/applications/
  
  chmod +x bauh-tray
  mv bauh-tray $pkgdir/usr/local/bin/
}
