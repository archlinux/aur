# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.5.0.RC
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
source=("${url}/archive/009e67dd2fc244727041be6e1223ddc3331d51ce.zip")
sha512sums=('3ecfbcb7040c887badb263df6e2f589d8b4ec593a70fc0faad82c21824ddc43bb5d981db2887def97ee89615eb0c617132c0b9d610834d72fe0f8aa615f0dd38')

build() {
  cd "${srcdir}/fpakman-009e67dd2fc244727041be6e1223ddc3331d51ce"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-009e67dd2fc244727041be6e1223ddc3331d51ce"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
