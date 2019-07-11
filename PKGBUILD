# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.1.RC
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/4d3abfcf8922572f51da8119be121ceeff34ad65.zip")
sha512sums=('adf80a13a6859c124517888e89b5677dad937a1121d3600e2f51af06c452add6c71536e012b1455958a3a12a58e944610f6f1b19d5e80f3eba301de063e0995c')

build() {
  cd "${srcdir}/fpakman-4d3abfcf8922572f51da8119be121ceeff34ad65"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-4d3abfcf8922572f51da8119be121ceeff34ad65"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications  
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
