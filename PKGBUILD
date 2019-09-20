# Maintainer: Vinicius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=bauh-staging
pkgver=0.6.0.RC
pkgrel=2
pkgdesc="Free non-official GUI for Flatpak / Snap / AUR applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: to install Flatpaks' 'snapd: to install Snaps' 'git: to downgrade AUR packages' 'pacman: to install AUR packages' 'wget: to install AUR packages')
makedepends=('git' 'python-setuptools')
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/b72590287d730e4f1921c7176f96fcdaa3539d18.tar.gz")
sha512sums=('da7c35441db5274cd85ffd183d456cf5a8363d5f288d686ea9237d40a507c78b9ef1afd3f6c7a3fcf8504d0b8938655efd874a5993d9f58f0450b402151bf602')

build() {
  cd "${srcdir}/bauh-b72590287d730e4f1921c7176f96fcdaa3539d18"
  python3 setup.py build
}

package() {
  cd "${srcdir}/bauh-b72590287d730e4f1921c7176f96fcdaa3539d18"
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
