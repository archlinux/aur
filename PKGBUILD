# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.2.1.6
pkgrel=1
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/009503fa36f9c74b72eed9aca567f4dd62c71b32.zip")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/fpakman-009503fa36f9c74b72eed9aca567f4dd62c71b32"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-009503fa36f9c74b72eed9aca567f4dd62c71b32"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py

  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
