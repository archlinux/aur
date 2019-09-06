# Maintainer: Vinicius Moreira

pkgname=bauh-staging
pkgver=0.5.2.RC
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
source=("${url}/archive/641d3a7601fff482c3b6d0acfb71341f66ec25b4.zip")
sha512sums=('9a16a99bd7c8e4bbc5df371b799d2cf899ef40f2ce295f6aedc7ebfe582595c3ba99256450ebc696a3f7b6d6784c53ebc978a523e4d8d247699d39757624b9e5')

build() {
  cd "${srcdir}/bauh-641d3a7601fff482c3b6d0acfb71341f66ec25b4"
  python3 setup.py build
}

package() {
  cd "${srcdir}/bauh-641d3a7601fff482c3b6d0acfb71341f66ec25b4"
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
