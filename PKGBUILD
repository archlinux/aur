# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.0
pkgrel=4
pkgdesc="Non-official GUI for Flatpak applications management (staging branch: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/a1e83a5d1908b70c7fe13d20521ec3bf06ce4c24.zip")
sha512sums=('e2e383992421917bbd89848c5284dff3b5ab3e7a4d8ef5f759e1052dc1f8f668aa043ccd710ca5dca36b58829e60db19d4f60d1b50e927f6497508f049e076fd')

build() {
  cd "${srcdir}/fpakman-a1e83a5d1908b70c7fe13d20521ec3bf06ce4c24"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-a1e83a5d1908b70c7fe13d20521ec3bf06ce4c24"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py

  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
