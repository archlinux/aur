# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.2.1
pkgrel=7
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/fa871f000d7cdfe2d1bed6f1bcefb61ca7bcef7a.zip")
sha512sums=('541820178c121f8ebba0c6d728139158dd7a594472172591af1f43d71622089179299efd23d5f1cc6d6d2b545b417915b9354a83c9c7947871f3fbf5025f3ac4')

build() {
  cd "${srcdir}/fpakman-fa871f000d7cdfe2d1bed6f1bcefb61ca7bcef7a"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-fa871f000d7cdfe2d1bed6f1bcefb61ca7bcef7a"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py

  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
