# Maintainer: kenjaku-dev <kenjaku.dev@gmail.com>

pkgname=snapcap-wayland
pkgver=0.2.0
pkgrel=2
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
sha256sums=('6288c21405f79c3162ac014bca646cf35a8038cf8c653a68ed171a91d9bc5b1a'
            '6fcb9d9976beeb4bf24ff0f12a424c4d6dc7d42ac01c2a30d11e24003cde5d7f')

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
