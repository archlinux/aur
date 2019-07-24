# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.0.RC
pkgrel=2
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama' 'python-beautifulsoup4')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/f7e98dec661de3d1a7f0ba5a1c23b6e1729e592f.zip")
sha512sums=('7ad240537948a21e1130d0279e164934be3a7c651f772ee68f73678a0254242118a372bb8722230d9a1938009c1cb74aa693ad02f5aac501768d2a18ddd4a947')

build() {
  cd "${srcdir}/fpakman-f7e98dec661de3d1a7f0ba5a1c23b6e1729e592f"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-f7e98dec661de3d1a7f0ba5a1c23b6e1729e592f"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
