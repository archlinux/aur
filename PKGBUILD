# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.3.RC
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
source=("${url}/archive/2f631ca903914c050d98e318463b8a321dabedeb.zip")
sha512sums=('46755ed7029cb8c97616f523f7322583564b3d705c04519eb0feaecef26fcfa731778c2baad7efdf9485adeec3f56334c6e0c9f45b830140af71dff8fc5814dd')

build() {
  cd "${srcdir}/fpakman-2f631ca903914c050d98e318463b8a321dabedeb"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-2f631ca903914c050d98e318463b8a321dabedeb"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
