# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.3.RC
pkgrel=4
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/17b9e55953719035df9d6229915e3eca106aabb1.zip")
sha512sums=('b4d64edd07e00586d87ca9d9168e3af3a6ec280136b0afccab7330e05bcd5891e2efe2c92d8ce2cc1d51cd01d1e14d85aee619a2415bf120befac096fdda66ea')

build() {
  cd "${srcdir}/fpakman-17b9e55953719035df9d6229915e3eca106aabb1"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-17b9e55953719035df9d6229915e3eca106aabb1"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
}
