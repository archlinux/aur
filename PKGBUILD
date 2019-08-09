# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.5.1.RC
pkgrel=5
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/ccbd57df22273aecf0d71543c9d7ada49781ef59.zip")
sha512sums=('3677ed1e08db15df7722fe01b4f7c99413c022c42175ec88063a2860915a98342daefae5225ecc1c3bbb84de74effab57bd564b7fd1cb34316420c29fcce673d')

build() {
  cd "${srcdir}/fpakman-ccbd57df22273aecf0d71543c9d7ada49781ef59"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-ccbd57df22273aecf0d71543c9d7ada49781ef59"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/local/bin

  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
  
  chmod +x fpakman-tray
  mv fpakman-tray $pkgdir/usr/local/bin/
}
