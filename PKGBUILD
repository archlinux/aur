# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.1.RC
pkgrel=4
pkgdesc="Free non-official GUI for Flatpak applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/332d3cb787046c759100d4ca0388fbc91e887482.zip")
sha512sums=('55fa175cf79dfcfe4ad499e835af9b122ea06a2ec891ce678d8092f9e92926bc828c1236b793f901a2c962cade680b08161560fc14ca44f597bdfc7c73a3f711')

build() {
  cd "${srcdir}/fpakman-332d3cb787046c759100d4ca0388fbc91e887482"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-332d3cb787046c759100d4ca0388fbc91e887482"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
