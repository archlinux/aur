# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=not1mm-9m2pju-git
_pkgname=not1mm
pkgver=r2188.05119a4
pkgrel=1
pkgdesc="Not1MM != N1MM, An amateur radio contest logger for Linux. Git version."
arch=('any')
url="https://github.com/mbridak/not1mm"
license=('GPL3')
depends=(
  'python' 'python-pyqt5' 'python-pyqt6' 'python-requests' 'python-dicttoxml' 'python-xmltodict'
  'python-psutil' 'python-sounddevice' 'python-soundfile' 'python-numpy'
  'python-notctyparser' 'python-pyserial' 'python-appdata' 'python-gobject'
  'python-thefuzz' 'python-levenshtein' 'gtk4' 'hamradio-menus'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=('hamlib' 'flrig')
conflicts=('not1mm')
provides=('not1mm')
source=("$pkgname::git+$url.git")
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Desktop icon
  install -Dm755 "not1mm/data/k6gte-not1mm.desktop" "$pkgdir/usr/share/applications/k6gte-not1mm.desktop"
  install -Dm644 "not1mm/data/k6gte.not1mm-128.png" "$pkgdir/usr/share/pixmaps/k6gte-not1mm.png"
}
