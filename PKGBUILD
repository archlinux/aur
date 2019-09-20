# Maintainer: Vinicius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=bauh-staging
pkgver=0.6.0.RC
pkgrel=4
pkgdesc="Free non-official GUI for Flatpak / Snap / AUR applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: to install Flatpaks' 'snapd: to install Snaps' 'git: to downgrade AUR packages' 'pacman: to install AUR packages' 'wget: to install AUR packages')
makedepends=('git' 'python-setuptools')
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/0d2770296c04459f4095ff15457314e1139c8353.tar.gz")
sha512sums=('beca5f0be248e4757242fd7be43a490102a0c7f8f830b1b469d7327078d8fb4b73339ec08551f31f8d6e520e5855f84f1b3a46fc2b48d2c379a8b45e7f19e81a')

build() {
  cd "${srcdir}/bauh-0d2770296c04459f4095ff15457314e1139c8353"
  python3 setup.py build
}

package() {
  cd "${srcdir}/bauh-0d2770296c04459f4095ff15457314e1139c8353"
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
