# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=not1mm-9m2pju-git
pkgver=r2195.50b99a0  # placeholder; will be auto-generated
pkgrel=1
pkgdesc="Not1MM != N1MM, An amateur radio contest logger for Linux. "
arch=('any')
url="https://github.com/mbridak/not1mm"
license=('GPLv3')
depends=('python' 'python-pyqt5' 'python-pyqt6' 'python-requests' 'python-dicttoxml' 'python-xmltodict' 'python-psutil' \
	 'python-sounddevice' 'python-soundfile' 'python-numpy' 'python-notctyparser' 'python-pyserial' 'python-appdata' \
	 'python-gobject' 'python-thefuzz' 'python-levenshtein' 'gtk4' 'hamradio-menus')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('not1mm')
conflicts=('not1mm')
install=not1mm-9m2pju-git.install
source=("$pkgname::git+https://github.com/mbridak/not1mm.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
