# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.1.RC
pkgrel=3
pkgdesc="Free non-official GUI for Flatpak applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/1ecfc83ed51fa040dfb0ebb906660aa55dd6e2f8.zip")
sha512sums=('b9b4eb16f71e0aeb594ae820319a54a283b45fcb49fbedc6447435f9c3853225130ea0236d471c1a353b256db7962081857d48da1ed05a17533bcdf34c7e1e2d')

build() {
  cd "${srcdir}/fpakman-1ecfc83ed51fa040dfb0ebb906660aa55dd6e2f8"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-1ecfc83ed51fa040dfb0ebb906660aa55dd6e2f8"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
