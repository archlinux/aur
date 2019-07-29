# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.3.RC
pkgrel=2
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/fecd15f34a76d4d3d415088adcbbf7cd106c514d.zip")
sha512sums=('7c6093a3256678e2b80726722193b7bbe977a26be93cc6fae6bbf38f43950c1c27b26ca422306a830e85f36c3d5bee0596049242440d80fbe654632991659dfa')

build() {
  cd "${srcdir}/fpakman-fecd15f34a76d4d3d415088adcbbf7cd106c514d"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-fecd15f34a76d4d3d415088adcbbf7cd106c514d"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
