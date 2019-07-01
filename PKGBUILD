# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.0
pkgrel=6
pkgdesc="Free non-official GUI for Flatpak applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/d8397797a9b74b54acb7f44c9c3244efb627ba5f.zip")
sha512sums=('78d933ef9d2780c80faa30e28217c3db7022626285d0b47c2cb0203e6b1473445c6c9b48de5e4358b863c03dd1b6302d20fc2814c98991bd49b2ca41251b4f9d')

build() {
  cd "${srcdir}/fpakman-d8397797a9b74b54acb7f44c9c3244efb627ba5f"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-d8397797a9b74b54acb7f44c9c3244efb627ba5f"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications  
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
