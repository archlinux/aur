# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.0.RC
pkgrel=3
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama' 'python-beautifulsoup4')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/b674bb25840edb91e85ba03da825b19de45f73c3.zip")
sha512sums=('5d824f5002ae1405fa4001587b159740a1078a73fed871d7a3abd888ecfde50438351bde68bc1808cfc4211773c17538ee9ef481e9b81955718eeafd697ea2c6')

build() {
  cd "${srcdir}/fpakman-b674bb25840edb91e85ba03da825b19de45f73c3"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-b674bb25840edb91e85ba03da825b19de45f73c3"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
