# Maintainer: Vinicius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=bauh-staging
pkgver=0.6.0.RC
pkgrel=3
pkgdesc="Free non-official GUI for Flatpak / Snap / AUR applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: to install Flatpaks' 'snapd: to install Snaps' 'git: to downgrade AUR packages' 'pacman: to install AUR packages' 'wget: to install AUR packages')
makedepends=('git' 'python-setuptools')
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/57e17c79d8391526994e59397cfc87c3c731240a.tar.gz")
sha512sums=('6d4bcca6f02287554f898851ed9fe83f831a781a39fe75dc967ae3bec5f5ff3165c0c3ee087d82d2592911300846cc726788b376f598ef12e422ee9eeb18684b')

build() {
  cd "${srcdir}/bauh-57e17c79d8391526994e59397cfc87c3c731240a"
  python3 setup.py build
}

package() {
  cd "${srcdir}/bauh-57e17c79d8391526994e59397cfc87c3c731240a"
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
