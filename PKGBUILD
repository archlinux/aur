# Maintainer: Vinicius Moreira

pkgname=fpakman
pkgver=0.3.1
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak applications management."
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman-staging')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('edbbd21c0a795dd6719a61955e7664bebce830c0190e963630096558b96ac2153ecdd974bb88de3a1fe02c3ff4493c0264c8828a14fb90beb65d9fb079857adf')

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
