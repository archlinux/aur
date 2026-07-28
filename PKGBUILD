# Maintainer: kenjaku-dev <kenjaku.dev@gmail.com>

pkgname=snapcap-wayland
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight screenshot capture tool for Wayland (wlroots)"
arch=('x86_64')
url="https://github.com/kenjaku-dev/snapcap-wayland"
license=('GPL3')
depends=(
  'grim'
  'python'
  'python-pyside6'
  'slurp'
)
optdepends=(
  'wl-clipboard: native Wayland clipboard support'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("$url/archive/v$pkgver.tar.gz"
        "snapcap-wayland.desktop")
sha256sums=('4cd8059317c0079a8b2bbff420f318d0f009a822bc0e083f57afef83cda67a1a'
            '4124a9f4d3d0a332dfddc32488ae5b1e80e2485ffbc96dd53e84c4de1de3f4ce')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/snapcap-wayland.desktop" "$pkgdir/usr/share/applications/snapcap-wayland.desktop"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/snapcap.png"
}
