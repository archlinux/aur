# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=not1mm-9m2pju-git
pkgver=r2188.05119a4
pkgrel=1
pkgdesc="Ham Radio Contest Logger - Not1MM (latest from git)"
arch=('any')
url="https://github.com/mbridak/not1mm"
license=('GPL-3.0-only')
provides=('not1mm')
conflicts=('not1mm')
install=${pkgname}.install
depends=(
  'python'
  'python-pyqt5'
  'python-pyqt6'
  'python-requests'
  'python-dicttoxml'
  'python-xmltodict'
  'python-psutil'
  'python-sounddevice'
  'python-soundfile'
  'python-numpy'
  'python-notctyparser'
  'python-pyserial'
  'python-appdata'
  'python-gobject'
  'python-thefuzz'
  'python-levenshtein'
  'gtk4'
  'hamradio-menus'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=('hamlib' 'flrig')
source=("${pkgname}::git+https://github.com/mbridak/not1mm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git clean -dfx
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm755 "not1mm/data/k6gte-not1mm.desktop" "$pkgdir/usr/share/applications/k6gte-not1mm.desktop"
  install -Dm755 "not1mm/data/k6gte.not1mm-128.png" "$pkgdir/usr/share/pixmaps/k6gte-not1mm.png"
}
