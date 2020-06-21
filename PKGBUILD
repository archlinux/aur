# Maintainer: jtheoof <contact@jtheoof.me>
pkgname=swappy
pkgver=1.0.1
pkgrel=1
license=('MIT')
pkgdesc='Grab and edit screenshots from a Wayland compositor'
depends=(
  "cairo"
  "gtk3"
  "pango"
)
optdepends=(
  "libnotify"
  "otf-font-awesome"
)
makedepends=(
  "meson"
  "scdoc"
  "git"
)
arch=("x86_64")
url='https://github.com/jtheoof/swappy'
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/jtheoof/swappy/archive/v$pkgver.tar.gz"
)
sha256sums=(
  '68813485df9f1d0f7413ce0f5500c0641eb55d8425fbe39dca594f773fcafeec'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  if [ -f LICENSE ]; then
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  fi

  DESTDIR="$pkgdir/" ninja -C build install
}

