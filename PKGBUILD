# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.5.0.RC
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/93ba7cb8fc4a6d40d51b2588d2df468519105f9d.zip")
sha512sums=('5731952ee641388dbff205add4a3bb636851dacb459f46c31556e8be75747c48f81cf4efad8fe68720f9d67427418c1311b730f7ed0d07fdaa97c60cbc724ce5')

build() {
  cd "${srcdir}/fpakman-93ba7cb8fc4a6d40d51b2588d2df468519105f9d"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-93ba7cb8fc4a6d40d51b2588d2df468519105f9d"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
