# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.0
pkgrel=5
pkgdesc="Free non-official GUI for Flatpak applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/70476bc4b78e7cd910e2ca629e80e7b05d2e54e4.zip")
sha512sums=('14deab74599efe458c4ee8ceb5f8884260fcf6c98efaa9c4e3d1bd4bc4c69afa8634d1d8258d9dc39ce38f1fc5aa859b1ad0e5b0e86eca0c9df2ede53504047b')

build() {
  cd "${srcdir}/fpakman-70476bc4b78e7cd910e2ca629e80e7b05d2e54e4"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-70476bc4b78e7cd910e2ca629e80e7b05d2e54e4"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications  
  mv fpakman.desktop $pkgdir/usr/share/applications/

  mkdir -p $pkgdir/usr/share/icons/fpakman/resources/img
  cp fpakman/resources/img/* $pkgdir/usr/share/icons/fpakman/resources/img
}
