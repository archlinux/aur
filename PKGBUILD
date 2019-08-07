# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.5.1.RC
pkgrel=3
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/6313da8a7b8e980ae38ba4ded9c84090e791151a.zip")
sha512sums=('6b268b960281c2ba53d0656aff894fb09ea0a7140f40064e4f46b4dafa2ab89c78bb8d737c40352004a90339404031b664ee779319b6671f179cdeb1b49f74eb')

build() {
  cd "${srcdir}/fpakman-6313da8a7b8e980ae38ba4ded9c84090e791151a"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-6313da8a7b8e980ae38ba4ded9c84090e791151a"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
