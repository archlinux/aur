# Maintainer: Vinicius Moreira

pkgname=fpakman
pkgver=0.4.2
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap applications management."
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('73f9cc2a9f3d6c923dae9a253fc85432217adef66bef011230708c619a988ec95067303f6221663c0249001d0266c10bb4c43d547d9956a919ef29dd68147bb9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py

  mkdir -p $pkgdir/usr/share/applications  
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
