# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.3.RC
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
source=("${url}/archive/aacd0c72d65e2f8f0da1115078936997256b47db.zip")
sha512sums=('7a9fa871732edeec477d731c0c58d853fafcc3e308b139aa2c492f8188a8a72891fedca99aac53b86a30396d391d8feab4ceef7b48d51e14951e5c7ee2aafe0c')

build() {
  cd "${srcdir}/fpakman-aacd0c72d65e2f8f0da1115078936997256b47db"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-aacd0c72d65e2f8f0da1115078936997256b47db"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
