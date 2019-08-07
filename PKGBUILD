# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.5.1.RC
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
source=("${url}/archive/b64090f2afaaf80b573aef5e1b23d6990a6ce4f1.zip")
sha512sums=('bc2cc0fc4dc9cd2b27d5f104ae5361640f28b639128c981cd784aa034a1042047324c8c9598c6822e95110dc5804605fb11bd9af8cd9eecad30b5d28e714299e')

build() {
  cd "${srcdir}/fpakman-b64090f2afaaf80b573aef5e1b23d6990a6ce4f1"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-b64090f2afaaf80b573aef5e1b23d6990a6ce4f1"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
