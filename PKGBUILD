# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.0
pkgrel=2
pkgdesc="Non-official GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/e3a8df5dabffd388a79322a8e31207900b844587.zip")
sha512sums=('a7f5e72c8ddd1f28e26830b120ff9f5779a132412fdae5a04074426ef2c0d937b9ea46c1eb9e15f478d15e52e44706920681d38c4149ef784027a70f079d20e8')

build() {
  cd "${srcdir}/fpakman-e3a8df5dabffd388a79322a8e31207900b844587"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-e3a8df5dabffd388a79322a8e31207900b844587"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py

  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
