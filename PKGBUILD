# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.1.RC
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
source=("${url}/archive/fd9bcd43e79255832c5c9126a8f57a3d3c2bb4b0.zip")
sha512sums=('28f8b13ae3f69dcc8a4506d83feaf52b0adbd876f93f41965ef766244557246980f59336ca35a708c355d562e1598bf6471a73e477e91c2d281e6b89926a87dc')

build() {
  cd "${srcdir}/fpakman-fd9bcd43e79255832c5c9126a8f57a3d3c2bb4b0"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-fd9bcd43e79255832c5c9126a8f57a3d3c2bb4b0"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
