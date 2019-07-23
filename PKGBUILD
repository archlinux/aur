# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.0.RC
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama' 'python-beautifulsoup4')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/854ad2a102f562febdac8a351c902b9252d804fe.zip")
sha512sums=('7b518d1def256ed148ddc78ff134d3cdebbd6bfd393298f0688fe51085bff4929121d0b0d7609373cd1dc92918b6bcfb28ea698233dba096dc3221b98b534df5')

build() {
  cd "${srcdir}/fpakman-854ad2a102f562febdac8a351c902b9252d804fe"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-854ad2a102f562febdac8a351c902b9252d804fe"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
