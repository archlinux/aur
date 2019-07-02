# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.0
pkgrel=7
pkgdesc="Free non-official GUI for Flatpak applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/709915bc0a2a1b25dcd0638c5bbe54cda0c25364.zip")
sha512sums=('e86dddbc5592f8ae1c4dfe8a9bff36b37f16b5ebfeea731fb802ce24e03749302e2c5dc9f721ecdb9da419984d1c7d88f20cbb01ff95164424929bc46a03e9b4')

build() {
  cd "${srcdir}/fpakman-709915bc0a2a1b25dcd0638c5bbe54cda0c25364"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-709915bc0a2a1b25dcd0638c5bbe54cda0c25364"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications  
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
