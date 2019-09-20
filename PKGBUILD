# Maintainer: Vinicius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=bauh-staging
pkgver=0.6.0.RC
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap / AUR applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: to install Flatpaks' 'snapd: to install Snaps' 'git: to downgrade AUR packages' 'pacman: to install AUR packages' 'wget: to install AUR packages')
makedepends=('git' 'python-setuptools')
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/04846928eb74f0d4fe31cd2f2a6512da4feb1c9a.tar.gz")
sha512sums=('09d05c9baea7a86a7a6564b8de5952ad1a724c4444cee44aee4017e506bc772b91c7bd3efc2264d51299e4a51e2a80761e843da654f273de1b834c6cde0588db')

build() {
  cd "${srcdir}/bauh-04846928eb74f0d4fe31cd2f2a6512da4feb1c9a"
  python3 setup.py build
}

package() {
  cd "${srcdir}/bauh-04846928eb74f0d4fe31cd2f2a6512da4feb1c9a"
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
