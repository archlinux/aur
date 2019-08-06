# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.5.1.RC
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
source=("${url}/archive/98140a98dcdcbeafa7ece1cc4c5963a3cb758f94.zip")
sha512sums=('1bbf5afc36680e451cbd2cd9f3ecd5554f7725dda9e7b5318a3e023462c7b020e2545ca4371c4058bb860d52ec4bb043852f03ceed757e65bddeacfac50a7956')

build() {
  cd "${srcdir}/fpakman-98140a98dcdcbeafa7ece1cc4c5963a3cb758f94"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-98140a98dcdcbeafa7ece1cc4c5963a3cb758f94"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
