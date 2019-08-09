# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.5.1.RC
pkgrel=4
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/b7d1314adf4e294a3192151b096b286a76813fe8.zip")
sha512sums=('0c4c84823596ef177e77975819bdc0366fec0156e5aba6a265660f51ef4835ca422fab2a63c2d45c892cf6e1bca1ac1f67b77c443fabbe982ffaa578d0f4b8c8')

build() {
  cd "${srcdir}/fpakman-b7d1314adf4e294a3192151b096b286a76813fe8"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-b7d1314adf4e294a3192151b096b286a76813fe8"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/local/bin

  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
  
  chmod +x fpakman-tray
  mv fpakman-tray $pkgdir/usr/local/bin/
}
