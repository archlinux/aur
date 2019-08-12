# Maintainer: Vinicius Moreira

pkgname=bauh
pkgver=0.5.1
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap applications management."
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('78ef5fa564e35cf7c73d79fab2547f41e9a89a16da389e5acda60aeefd3caa1870159f4a40fd33ff81a0a4bf8e863506f511d31b8e7c9e4971734c77f31e59d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
