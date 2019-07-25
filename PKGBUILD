# Maintainer: Vinicius Moreira

pkgname=fpakman
pkgver=0.4.1
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap applications management."
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman-staging')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('6b0664dbacd3ac07cdc66020f9e4d77ebc0bca5b2972cb78b77a661734ca749d82c8e7040857d4aad05f56e8f91ec931dc27920547b5a8fe5b6cd65c543efb5a')

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
