# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.3.RC
pkgrel=5
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/d4a0f4041f6fce71672b4e3ea1254cf74d64db01.zip")
sha512sums=('9277f8c45ae62d402620941f3e19a45a3d19327eb6fc77e67294d0e9b7558d82f57e527c638fe3c7cb0836ee09c65f6a4d15e2c766f2f6806f775ff5105318c2')

build() {
  cd "${srcdir}/fpakman-d4a0f4041f6fce71672b4e3ea1254cf74d64db01"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-d4a0f4041f6fce71672b4e3ea1254cf74d64db01"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
