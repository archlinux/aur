# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.0
pkgrel=3
pkgdesc="Non-official GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/da00eacd1faa738ac85dcf0cd5518ad29bb2ccf5.zip")
sha512sums=('b7dfdf16c9efc7b472c1958d55faeb0622ea02ec2032189770b2cb2b6245578f76e34f0518e09933e25bd8058b86fcdcb0f894c595f4d1cc626eca1acd27b0ff')

build() {
  cd "${srcdir}/fpakman-da00eacd1faa738ac85dcf0cd5518ad29bb2ccf5"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-da00eacd1faa738ac85dcf0cd5518ad29bb2ccf5"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py

  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
