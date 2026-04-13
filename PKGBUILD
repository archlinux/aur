# Maintainer: mucahitzor <mucahitzor@users.noreply.github.com>
pkgname=ccbuddy-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Pixel crab desktop pet for Wayland"
arch=('any')
url="https://github.com/mucahitzor/ccbuddy"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'gtk3'
  'gtk-layer-shell'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=('ccbuddy')
conflicts=('ccbuddy')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
