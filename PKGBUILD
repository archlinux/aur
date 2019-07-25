# Maintainer: Vinicius Moreira

pkgname=fpakman
pkgver=0.4.0
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap applications management."
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama' 'python-beautifulsoup4')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman-staging')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('66c80f5f88e997ceeee268123bee60eca822954b1af2c10de5f57f84cd23473753d54af2a5671dbb0d3fc84f16042f1642d31aebcc1010bd14f2aa0acfa2d254')

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
