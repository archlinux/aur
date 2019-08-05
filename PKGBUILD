# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.5.0.RC
pkgrel=2
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/193c8bc2bc2d09919d53fd9d440bd325b3585832.zip")
sha512sums=('17501774e4d2a9966e1e2c0d280bbac83f157ba6dec9b37991cfe0132a3e5e50885f3d8b651a9bc84a1e9c7e4ec90f4dbe221e24b9ecf302d14855ce66b4e0c5')

build() {
  cd "${srcdir}/fpakman-193c8bc2bc2d09919d53fd9d440bd325b3585832"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-193c8bc2bc2d09919d53fd9d440bd325b3585832"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
