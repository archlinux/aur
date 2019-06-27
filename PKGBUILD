# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.0
pkgrel=1
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/ead09077c0bc164f38fbe009311b5a9c22be55c1.zip")
sha512sums=('59213c2f126165ad6d95e7119106f5ad9ef854dd0039c69cad9911c4a1981d0737228b4819229b9b49ac2673233b0d8166b50c9bef82fe40797bfe2fbc5ffdc2')

build() {
  cd "${srcdir}/fpakman-ead09077c0bc164f38fbe009311b5a9c22be55c1"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-ead09077c0bc164f38fbe009311b5a9c22be55c1"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py

  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
