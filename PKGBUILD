# Maintainer: kenjaku-dev <kenjaku.dev@gmail.com>

pkgname=chamelshot
pkgver=0.3.0
pkgrel=1
pkgdesc="A lightweight screenshot capture tool for Wayland (wlroots)"
arch=('x86_64')
url="https://github.com/kenjaku-dev/chamelshot"
license=('GPL3')
conflicts=('snapcap-wayland')
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
        "chamelshot.desktop")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/chamelshot.desktop" "$pkgdir/usr/share/applications/chamelshot.desktop"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/chamelshot.png"
}
